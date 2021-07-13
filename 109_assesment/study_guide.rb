# # arr = [1,2,4,5]
# # arr2 = ['me', 'you', 'her', 'him']
# #
# # def reverse_arr(arr)
# #   new_arr = []
# #   arr.length.times do |index|
# #     new_arr.push(arr.pop)
# #   end
# #   new_arr
# # end
# #
# # puts reverse_arr(arr)
# # puts reverse_arr(arr2)
#
# # iterate over the array's elements
# # check if the current index of that element is a fibonacci number
# # if it is, return true so that element is selected for the new array
# arr = ['yes','yes','yes','yes','no','yes','no']
#
# def index_fib_grabber(arr)
#   return arr.select do |element|
#     is_fibonacci?(arr.index(element))
#   end
# end
#
# # tests a number to see if it is in the fibonacci sequence
# def is_fibonacci?(num)
#   # setup
#   fib_arr = [0,1]
#   next_index = 2
#   # quick check for special nums 0 & 1
#   if fib_arr.include?(num)
#     return true
#   end
#   # loop for nums greater than 2
#   while true
#     fib_arr[next_index] = fib_arr[next_index-1] + fib_arr[next_index-2]
#     if fib_arr[next_index] == num
#       return true
#     else if fib_arr[next_index] > num
#       return false
#     end
#   end
#     next_index += 1
#   end
# end
#
# puts is_fibonacci?(5)
# puts is_fibonacci?(10)
# puts is_fibonacci?(55)
#
# print index_fib_grabber(arr)


def is_palindrome?(string)
  # initialize an array of the word's letters
  string_arr = string.split('')
  # initialize an array to store the words letters backwards
  final_arr = []
  # fill the empty array with the og array's contents, backwards
  string_arr.length.times do
    final_arr.push(string_arr.pop)
  end
  # turn the final array back into a string and compare to string
  if final_arr.join.to_s == string
    true
  else false
  end
end

puts is_palindrome?('billy')
puts is_palindrome?('palmyra')
puts is_palindrome?('maam')
