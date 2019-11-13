class Campaign
  def initialize(condition, *qualifiers)
    @condition = condition == :default ? :all? : (condition.to_s + '?').to_sym
    @qualifiers = PostCartAmountQualifier ? [] : [] rescue qualifiers.compact
    @line_item_selector = qualifiers.last unless @line_item_selector
    qualifiers.compact.each do |qualifier|
      is_multi_select = qualifier.instance_variable_get(:@conditions).is_a?(Array)
      if is_multi_select
        qualifier.instance_variable_get(:@conditions).each do |nested_q|
          @post_amount_qualifier = nested_q if nested_q.is_a?(PostCartAmountQualifier)
          @qualifiers << qualifier
        end
      else
        @post_amount_qualifier = qualifier if qualifier.is_a?(PostCartAmountQualifier)
        @qualifiers << qualifier
      end
    end if @qualifiers.empty?
  end

  def qualifies?(cart)
    return true if @qualifiers.empty?
    @unmodified_line_items = cart.line_items.map do |item|
      new_item = item.dup
      new_item.instance_variables.each do |var|
        val = item.instance_variable_get(var)
        new_item.instance_variable_set(var, val.dup) if val.respond_to?(:dup)
      end
      new_item
    end if @post_amount_qualifier
    @qualifiers.send(@condition) do |qualifier|
      is_selector = false
      if qualifier.is_a?(Selector) || qualifier.instance_variable_get(:@conditions).any? { |q| q.is_a?(Selector) }
        is_selector = true
      end rescue nil
      if is_selector
        raise "Missing line item match type" if @li_match_type.nil?
        cart.line_items.send(@li_match_type) { |item| qualifier.match?(item) }
      else
        qualifier.match?(cart, @line_item_selector)
      end
    end
  end

  def revert_changes(cart)
    cart.instance_variable_set(:@line_items, @unmodified_line_items)
  end
end

class BundleDiscount < Campaign
  def initialize(condition, customer_qualifier, cart_qualifier, discount, full_bundles_only, bundle_products)
    super(condition, customer_qualifier, cart_qualifier, nil)
    @bundle_products = bundle_products
    @discount = discount
    @full_bundles_only = full_bundles_only
    @split_items = []
    @bundle_items = []
  end

  def check_bundles(cart)
      bundled_items = @bundle_products.map do |bitem|
        quantity_required = bitem[:quantity].to_i
        qualifiers = bitem[:qualifiers]
        type = bitem[:type].to_sym
        case type
          when :ptype
            items = cart.line_items.select { |item| qualifiers.include?(item.variant.product.product_type) && !item.discounted? }
          when :ptag
            items = cart.line_items.select { |item| (qualifiers & item.variant.product.tags).length > 0 && !item.discounted? }
          when :pid
            qualifiers.map!(&:to_i)
            items = cart.line_items.select { |item| qualifiers.include?(item.variant.product.id) && !item.discounted? }
          when :vid
            qualifiers.map!(&:to_i)
            items = cart.line_items.select { |item| qualifiers.include?(item.variant.id) && !item.discounted? }
          when :vsku
            items = cart.line_items.select { |item| (qualifiers & item.variant.skus).length > 0 && !item.discounted? }
        end

        total_quantity = items.reduce(0) { |total, item| total + item.quantity }
        {
          has_all: total_quantity >= quantity_required,
          total_quantity: total_quantity,
          quantity_required: quantity_required,
          total_possible: (total_quantity / quantity_required).to_i,
          items: items
        }
      end

      max_bundle_count = bundled_items.map{ |bundle| bundle[:total_possible] }.min if @full_bundles_only
      if bundled_items.all? { |item| item[:has_all] }
        if @full_bundles_only
          bundled_items.each do |bundle|
            bundle_quantity = bundle[:quantity_required] * max_bundle_count
            split_out_extra_quantity(cart, bundle[:items], bundle[:total_quantity], bundle_quantity)
          end
        else
          bundled_items.each do |bundle|
            bundle[:items].each do |item|
              @bundle_items << item
              cart.line_items.delete(item)
            end
          end
        end
        return true
      end
      false
  end

  def split_out_extra_quantity(cart, items, total_quantity, quantity_required)
    items_to_split = quantity_required
    items.each do |item|
      break if items_to_split == 0
      if item.quantity > items_to_split
        @bundle_items << item.split({take: items_to_split})
        @split_items << item
        items_to_split = 0
      else
        @bundle_items << item
        split_quantity = item.quantity
        items_to_split -= split_quantity
      end
      cart.line_items.delete(item)
    end
    cart.line_items.concat(@split_items)
    @split_items.clear
  end

  def run(cart)
    raise "Campaign requires a discount" unless @discount
    return unless qualifies?(cart)

    if check_bundles(cart)
      @bundle_items.each { |item| @discount.apply(item) }
    end
    @bundle_items.reverse.each { |item| cart.line_items.prepend(item) }
    revert_changes(cart) unless @post_amount_qualifier.nil? || @post_amount_qualifier.match?(cart)
  end
end

class Qualifier
  def partial_match(match_type, item_info, possible_matches)
    match_type = (match_type.to_s + '?').to_sym
    if item_info.kind_of?(Array)
      possible_matches.any? do |possibility|
        item_info.any? do |search|
          search.send(match_type, possibility)
        end
      end
    else
      possible_matches.any? do |possibility|
        item_info.send(match_type, possibility)
      end
    end
  end

  def compare_amounts(compare, comparison_type, compare_to)
    case comparison_type
      when :greater_than
        return compare > compare_to
      when :greater_than_or_equal
        return compare >= compare_to
      when :less_than
        return compare < compare_to
      when :less_than_or_equal
        return compare <= compare_to
      when :equal_to
        return compare == compare_to
      else
        raise "Invalid comparison type"
    end
  end
end

class CartQuantityQualifier < Qualifier
  def initialize(total_method, comparison_type, quantity)
    @total_method = total_method
    @comparison_type = comparison_type
    @quantity = quantity
  end

  def match?(cart, selector = nil)
    case @total_method
      when :item
        total = cart.line_items.reduce(0) do |total, item|
          total + ((selector ? selector.match?(item) : true) ? item.quantity : 0)
        end
      when :cart
        total = cart.line_items.reduce(0) { |total, item| total + item.quantity }
    end
    if @total_method == :line_any || @total_method == :line_all
      method = @total_method == :line_any ? :any? : :all?
      qualified_items = cart.line_items.select { |item| selector ? selector.match?(item) : true }
      qualified_items.send(method) { |item| compare_amounts(item.quantity, @comparison_type, @quantity) }
    else
      compare_amounts(total, @comparison_type, @quantity)
    end
  end
end

class PercentageDiscount
  def initialize(percent, message)
    @discount = (100 - percent) / 100.0
    @message = message
  end

  def apply(line_item)
    line_item.change_line_price(line_item.line_price * @discount, message: @message)
  end
end

class ConditionalDiscountCodeRejection < Campaign
  def initialize(condition, customer_qualifier, cart_qualifier, li_match_type, line_item_qualifier, message)
    super(condition, customer_qualifier, cart_qualifier, line_item_qualifier)
    @li_match_type = li_match_type == :default ? :any? : (li_match_type.to_s + '?').to_sym
    @message = message == "" ? "This discount code cannot be used at this time" : message
  end

  def run(cart)
    return unless cart.discount_code
    cart.discount_code.reject({message: @message}) if qualifies?(cart)
  end
end

class Selector
  def partial_match(match_type, item_info, possible_matches)
    match_type = (match_type.to_s + '?').to_sym
    if item_info.kind_of?(Array)
      possible_matches.any? do |possibility|
        item_info.any? do |search|
          search.send(match_type, possibility)
        end
      end
    else
      possible_matches.any? do |possibility|
        item_info.send(match_type, possibility)
      end
    end
  end
end

class ReducedItemSelector < Selector
  def initialize(match_type)
    @invert = match_type == :not
  end

  def match?(line_item)
    @invert ^ line_item.discounted?
  end
end

CAMPAIGNS = [
  BundleDiscount.new(
    :all,
    nil,
    CartQuantityQualifier.new(
      :item,
      :greater_than_or_equal,
      3
    ),
    PercentageDiscount.new(
      25,
      "25% Bundle Discount Applied!"
    ),
    false,
    [{:type => "ptag", :qualifiers => ["bundle-product"], :quantity => "3"}]
  ),
  ConditionalDiscountCodeRejection.new(
    :all,
    nil,
    nil,
    :any,
    ReducedItemSelector.new(
      :is
    ),
    "This discount can't be used with the current 25% bundle discount."
  ),
].freeze

CAMPAIGNS.each do |campaign|
  campaign.run(Input.cart)
end

DISCOUNTS_BY_QUANTITY = {
  # Keto Bars - 12 Bars
  #1474096037959 => {
  #  6 => 18,
  #  3 => 16.7,
  #  2 => 8,
  #  1 => 0
  #},
  # Exogenous Ketone Base
  9557644422 => {
    #6 => 14,
    3 => 8,
    2 => 2,
    1 => 0
  },
  # Keto Collagen
  10702103893 => {
    #6 => 20,
    3 => 16,
    2 => 8,
    1 => 0
  },
  # MCT Oil Powder
  9557748422 => {
    #6 => 18,
    3 => 12,
    2 => 6,
    1 => 0
  },
  # Perfect Keto Nut Butter
  222535974933 => {
  #   6 => 20,
  #  3 => 10,
  #  2 => 0
  },
  # Instant Keto Coffee
  1329443504199 => {
    #6 => 18,
    3 => 12,
    2 => 8,
    1 => 0
  }
}

Input.cart.line_items.each do |line_item|
  puts line_item.inspect
  next if line_item.variant.product.gift_card? or !DISCOUNTS_BY_QUANTITY.include? line_item.variant.product.id

  quantity, discount = DISCOUNTS_BY_QUANTITY[line_item.variant.product.id].find do |quantity, _|
    line_item.quantity >= quantity
  end
  next unless discount

  message = "#{discount}% off when buying at least #{quantity}."

  line_item.change_line_price(
    line_item.line_price * (Decimal.new(1) - discount.to_d / 100),
    message: message,
  )
end

Output.cart = Input.cart
