# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# def select_fruit (hash) 
#   fruit_hash = {}
#   hash.each { |key, value| 
#     if value == 'Fruit'
#       fruit_hash[key] = value
#     end 
#   }
#   fruit_hash
# end

# puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# def double_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     numbers[counter] == current_number*2

#     counter += 1
#   end

#   numbers
# end


def multiply(numbers, multiplier)
  new_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    new_numbers << current_number*multiplier

    counter += 1
  end

  new_numbers
end