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

# puts "Enter the length of the room in meters:"
# length = gets.chomp().to_f
# puts "Enter the width of the room in meters:"
# width = gets.chomp().to_f
#
# area_meters = (length * width).round(2)
# area_feet = (area_meters * 10.7639).round(2)
#
# puts "The area of the room is #{area_meters} square meters (#{area_feet} square feet))."
#
#
# puts "What is the bill?"
# bill = gets.chomp().to_f.round(2)
# puts "What is the tip percentage?"
# tip_percentage = gets.chomp().to_f.round(2)
#
# tip = (bill * (tip_percentage/100)).round(2)
# total = (bill + tip).round(2)
#
# puts "The tip is $#{tip}"
# puts "The total is $#{total}"
#
# What is the bill? 200
# What is the tip percentage? 15
#
# The tip is $30.0
# The total is $230.0

# puts "What's your name?"
# name = gets.chomp()
#
# if name[name.length-1] == "!"
#   puts "HI #{name.upcase}. WHY ARE WE SCREAMING?"
# else puts "Hi #{name}."
# end

# 99.times {|i|
#   i += 1
#   if (i) % 2 == 1
#     puts i
#   end
# }
#
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.

# puts ">> Please enter an integer greater than 0:"
# int = gets.chomp().to_i
# puts ">> Enter 's' to compute the sum, 'p' to compute the product."
# operator = gets.chomp()
# text = ""
#
# if operator == 's'
#   text = "sum"
#   answer = (1..int).sum()
# else if operator == 'p'
#   text = "product"
#   answer = (1..int).inject(:*) || 1
#   puts factorial
#   end
# end
# # code
#
# puts "The #{text} of the integers between 1 and #{int} is #{answer}."

#
# puts "Enter the 1st number:"
# first_num = gets.chomp().to_i
# puts "Enter the 2nd number:"
# second_num = gets.chomp().to_i
# puts "Enter the 3rd number:"
# third_num = gets.chomp().to_i
# puts "Enter the 4th number:"
# fourth_num = gets.chomp().to_i
# puts "Enter the 5th number:"
# fifth_num = gets.chomp().to_i
# puts "Enter the last number:"
# last_num = gets.chomp().to_i
#
# arr = [first_num, second_num, third_num, fourth_num, fifth_num]
# puts (arr.include?(last_num)) ? "The number #{last_num} appears in #{arr}." : "The number #{last_num} does not appear in #{arr}."

#
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].
#
# def xor?(bool1, bool2)
#   if bool1 && !bool2 || !bool1 && bool2
#     return true
#   else return false
#   end
# end
#
# puts xor?(5.even?, 4.even?) == true
# puts xor?(5.odd?, 4.odd?) == true
# puts xor?(5.odd?, 4.even?) == false
# puts xor?(5.even?, 4.odd?) == false

# def palindrome?(str)
#   str == str.reverse
# end
#
# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true

# def palindrome?(str)
#   str == str.reverse
# end
#
# def real_palindrome?(str)
#   str.downcase!
#
#   palindrome?(str)
# end
#
# real_palindrome?('madam') == true
# real_palindrome?('Madam') == true           # (case does not matter)
# real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# real_palindrome?('356653') == true
# real_palindrome?('356a653') == true
# real_palindrome?('123ab321') == false
#
# def palindromic_number?(int)
#   int == (int.to_s.reverse.to_i)
# end
#
# puts palindromic_number?(34543) == true
# puts palindromic_number?(123210) == false
# puts palindromic_number?(22) == true
# puts palindromic_number?(5) == true



def rotate_array(arr)
  arr << arr.shift
end

def rotate_rightmost_digits(int, rotate_num)
  arr = int.digits.reverse!
  new_arr = arr.slice!(-rotate_num..arr.length-1)
  final_arr = (arr + rotate_array(new_arr)).join.to_i
end

# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917
#
#
# def max_rotation(number_to_rotate)
#   n = number_to_rotate.digits.size
#     # new_num = rotate_rightmost_digits(number_to_rotate, n)
#     # rotate_rightmost_digits(new_num, n - 1 )
#
#   puts rotate_rightmost_digits(rotate_rightmost_digits(number_to_rotate, n), n-1)
#
#   # def max_rotation(number)
#   #   number_digits = number.to_s.size
#   #   number_digits.downto(2) do |n|
#   #     number = rotate_rightmost_digits(number, n)
#   #   end
#   #   number
#   # end
#
#   # first_iteration = rotate_rightmost_digits(number_to_rotate, n)
#   # # puts first_iteration
#   # second_iteration = rotate_rightmost_digits(first_iteration, n-1)
#   # # puts second_iteration
#   # third_iteration = rotate_rightmost_digits(second_iteration, n-2)
#   # # puts third_iteration
#
# end
#
# puts max_rotation(735291) == 321579
# puts max_rotation(3) == 3
# puts max_rotation(35) == 53
# puts max_rotation(105) == 15 # the leading zero gets dropped
# puts max_rotation(8_703_529_146) == 7_321_609_845


def still_on (num_switches)
  # declare an array of size n with all boolean values true (rd 1)
  switch_arr = Array.new(num_switches, true)
  # print switch_arr
  # build a loop, starting at i (2), looking for array indices + 1 that are divisble by i
  rd = 2
  while rd <= num_switches
    switch_arr.each_index { |index|
      if (index + 1) % rd == 0
        switch_arr[index] = !switch_arr[index]
      end
    }
    rd += 1
  end
print switch_arr
# iterate over true/false values in the array, return an array, of the index value + 1
# of each true value
return_arr = []

switch_arr.each_index { |index|
  if switch_arr[index] == true
    return_arr << index + 1
  end
}
print return_arr

end

still_on(5)
still_on(10)
