# def repeat(str, int)
#   int.times do
#     puts str
#   end
# end
#
# repeat('Hello', 3)


# def is_odd?(num)
#   num % 2 == 1
# end
#
#
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# def count_occurrences(array)
#   count_arr = []
#   puts 'running'
#   array.each do |lmnt|
#     if !count_arr.include?(lmnt)
#       puts "#{lmnt} => #{array.count(lmnt)}"
#     end
#     count_arr << lmnt
#   end
# end
#
#
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]
#
# count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2


# def reverse_sentence(string)
#   if string.strip == ""
#     return ""
#   end
#
#   words_arr = string.split(" ").reverse
#   new_str = words_arr.join(' ')
# end
#
#
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''
#
#
# def reverse_words(str)
#   words_arr = str.split(" ")
#   # puts words_arr
#   new_arr = words_arr.map do |word|
#       if word.length >= 5
#         word.reverse!
#       else word
#       end
#   end
#   puts new_arr.join(' ')
# end
#
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# def stringy(int)
#   new_str = ""
#   new_int = 1
#   while int >= new_int do
#     if new_int % 2 == 1
#       new_str += "1"
#     else
#       new_str += "0"
#     end
#     new_int += 1
#   end
#   return new_str
# end
#
# def stringy(int)
#   new_str = ""
#
# end
#
#
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# def average(arr)
#   (arr.sum / arr.length)
# end
#
# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# def sum(int)
#   int.digits.sum
# end
#
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# def calculate_bonus(salary, eligible)
#   if eligible
#     salary / 2
#   else 0
#   end
# end
#
# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000

# age = rand(20..200)
# puts "Teddy is #{age} years old!"

puts "Enter the length of the room in meters:"
length = gets.chomp().to_f
puts "Enter the width of the room in meters:"
width = gets.chomp().to_f

area_meters = (length * width).round(2)
area_feet = (area_meters * 10.7639).round(2)

puts "The area of the room is #{area_meters} square meters (#{area_feet} square feet))."
