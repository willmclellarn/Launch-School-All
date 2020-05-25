# # arr = ['340', '15', '1', '3400']

# # arr.sort # => ['1', '15', '340', '3400']

# # a, b, c

# # Given the code below, select all the valid ways to 
# # return the value for the hash key :three.


# arr = [
#   {one: '1', two: 2},
#   [{four: 5, three: 6}, :three],
#   :three,
#   {2=>:two, 3=>:three}
# ]

# Given the following nested data structure, and without running the code, 
# select the correct option to change the string 'Apple Juice' to 'Orange Juice'.

# todo_lists = [
#   {
#     id: 1,
#     list_name: 'Groceries',
#     todos: [
#       { id: 1, name: 'Bread', completed: false },
#       { id: 2, name: 'Milk', completed: false },
#       { id: 3, name: 'Apple Juice', completed: false }
#     ]
#   }
# ]
# todo_lists[0][:todos][2][:name] = 'Orange Juice'

# Given the following nested data structure, and without running the code, 
# select all the options that would set the value for :completed to true 
# for all of the todos in the 'Homework' list.

#   todo_lists = [
#   {
#     id: 1,
#     list_name: 'Groceries',
#     todos: [
#       { id: 1, name: 'Bread', completed: false },
#       { id: 2, name: 'Milk', completed: false },
#       { id: 3, name: 'Apple Juice', completed: false }
#     ]
#   },
#   {
#     id: 2,
#     list_name: 'Homework',
#     todos: [
#       { id: 1, name: 'Math', completed: false },
#       { id: 2, name: 'English', completed: false }
#     ]
#   }
# ]

# todo_lists[1][:todos][0][:completed] = true
# todo_lists[1][:todos][1][:completed] = true

# todo_lists[1].each do |list_key, list_value|
#   if list_key == :todos
#     list_value.each { |todo| todo[:completed] = true }
#   end
# end

# Without running the code attempt to work out what the last three lines will output.


a = 'hi'
english_greetings = ['hello', a, 'good morning']

greetings = {
  french: ['bonjour', 'salut', 'allo'],
  english: english_greetings,
  italian: ['buongiorno', 'buonasera', 'ciao']
}

greetings[:english][1] = 'hey'
# it doesn't reference english_greetings as a variable.
# I think that means it's unchanged.
# false! it does reference it, greetings[:english] = english_greetings

greetings.each do |language, greeting_list|
  greeting_list.each { |greeting| greeting.upcase! }
end
# certainly uppercases everything inside greetings  
# but given its upcase + !, I think it does transform english_greetings
# is it passed by reference or passed by value?
# 

puts a
puts english_greetings[1]
puts greetings[:english][1]

# a = 'hi'
# english_greetings[1] = 'hi' -> 'hey' -> 'HEY'
# greetings[:english][1] 'hi' -> 'hey' -> 'HEY'


# [['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr|
#   sub_arr.map do |letter|
#     letter.upcase
#   end
# end

order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
  # rest of data...
]

customer_orders = order_data.map do |row|
  {
    customer_id: row[:customer_id],
    customer_name: row[:customer_name],
    orders: [
      {
        order_fulfilled: row[:order_fulfilled],
        order_value: row[:order_value]
      }
    ]
  }
end



all_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48},
  {customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65},
  # rest of data
]

fulfilled_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
  {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
  # rest of data
]




customer_orders = {}

order_data.each do |row|
  if customer_orders.has_key?(row[:customer_id])
    customer_orders[row[:customer_id]][:orders] << [
      row[:order_fulfilled],
      row[:order_value]
    ]
  else
    customer_orders[row[:customer_id]] = {
      customer_id: row[:customer_id],
      customer_name: row[:customer_name],
      orders: [
        [
          row[:order_fulfilled],
          row[:order_value]
        ]
      ]
    }
  end
end

customer_orders = customer_orders.values
{
  12: {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      true,
      true,
    ]
  }
}

customer_orders = {}

order_data.each do |row|
  if customer_orders.has_key?(row[:customer_id])
    customer_orders[row[:customer_id]][:orders] << {
      order_fulfilled: row[:order_fulfilled],
      order_value: row[:order_value]
    }
  else
    customer_orders[row[:customer_id]] = {
      customer_id: row[:customer_id],
      customer_name: row[:customer_name],
      orders: [
        {
          order_fulfilled: row[:order_fulfilled],
          order_value: row[:order_value]
        }
      ]
    }
  end
end

customer_orders = customer_orders.values

########


customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

# Question 9

all_orders = []

customer_orders.each do |customer_data|
  cust_arr = [
    [:customer_id, customer_data[:customer_id]],
    [:customer_name, customer_data[:customer_name]],
    [:total_order_value]
  ]

  order_value = 0
  customer_data[:orders].each do |order|
    order_value += order[:order_value]
  end

  cust_arr[2] << order_value

  all_orders << cust_arr
end


all_orders = []

customer_orders.each do |customer_data|
  customer_total_orders = {
    customer_id: customer_data[:customer_id],
    customer_name: customer_data[:customer_name],
    total_order_value: 0
  }

  customer_data[:orders].each do |order|
    customer_total_orders[:total_order_value] += order[:order_value]
  end

  all_orders << customer_total_orders
end



all_orders = customer_orders.map do |customer_data|
  order_value = customer_data[:orders].inject(0) do |total, order_data|
    total + order_data[:order_value]
  end

  {
    customer_id: customer_data[:customer_id],
    customer_name: customer_data[:customer_name],
    total_order_value: order_value
  }
end


all_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
    total + order[:order_value]
  end

  all_orders[index][:total_order_value] = order_value
end



customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

####### Question 10

fulfilled_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
    total + order[:order_value] if order[:order_fulfilled]
  end

  fulfilled_orders[index][:order_value] = order_value
end

fulfilled_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
  {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
  # rest of data
]

all_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
    total + order[:order_value]
  end

  all_orders[index][:total_order_value] = order_value
end