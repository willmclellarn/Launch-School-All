#1 
# arr = ['10', '11', '9', '7', '8']
# arr.sort_by do |string|
#   string.to_i * -1
# end
#their solution
# arr.sort do |a,b|
#   b.to_i <=> a.to_i
# end

#2
#How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?
# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]
# books.sort_by do |book|
#   book[:published].to_i
# end

#3
#For each of these collection objects demonstrate how you would reference the letter 'g'.
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# #['c', ['d', 'e', 'f', 'g']]
# #['d', 'e', 'f', 'g']

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# #{third: ['g', 'h', 'i']}
# #['g', 'h', 'i']

# arr3 = [['abc'], ['def'], {third: ['ghi']}]
# #{third: ['ghi']}
# #['ghi']
# #ghi

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# #'b' => ['f', 'g']
# #['f', 'g']

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# #{'g' => 0}

# # arr1[2][1][3]
# # arr2[1][:third][0]
# # arr3[2][:third][0][0]
# # hsh1[1]['b'][1] - wrong! used array outer level, smh
# # h2h2[:third].key(0)

# # For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.
# arr1 = [1, [2, 3], 4]

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

# hsh1 = {first: [1, 2, [3]]}

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# #
# arr1[1][1] = 4
# arr2[2] = 4
# #
# hsh1[:first][2][0] =4
# hsh2['a'][:a][2] = 4

#figure out the total age of just the male members of the family.

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
# total_age = 0
# munsters.each do |mun|
#   if munsters[mun.first]["gender"] == "male"
#     total_age += munsters[mun.first]["age"]
#   end
# end
# puts total_age
# total_age

# #their code
# total_male_age = 0
# munsters.each_value do |details|
#   total_male_age += details["age"] if details["gender"] == "male"
# end

# total_male_age # => 444

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
# #Given this previously seen family hash, print out the name, age and gender of each family member:

# #(Name) is a (age)-year-old (male or female).

# munsters.each_pair do |key, value|
#   puts "#{key} is a #{value["age"]}-year-old #{value["gender"]}"
# end

#Given this code, what would be the final values of a and b? Try to work this out without running the code.

# a = 2
# b = [5, 8]
# arr = [a, b]

# arr[0] += 2
# arr[1][0] -= a

#a = 4, [1,8]

#Using the each method, write some code to output all of the vowels from the strings.


# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# vowels = []
# hsh.each do |key, value|
#   value.each do |val|
#     new_arr = val.chars
#     vowels.concat(new_arr.select {|v| v =~ /[aeiou]/ })
#   end
# end
# puts vowels

# Given this data structure, return a new array of the same structure 
# but with the sub arrays being ordered (alphabetically or numerically
# as appropriate) in descending order.  

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
# new_arr = []

# arr.map do |ar| #key insight = mapping for a new array, same structure
#   ar.sort do |a,b|
#     b <=> a
#   end
# end
# new_arr

# Given the following data structure and without modifying the original array, 
# use the map method to return a new array identical in structure to the original 
# but where the value of each integer is incremented by 1

# arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# arr.map do |hash|
#   hash.each_value do |val|
#     val += 1
#   end 
# end

#Given the following data structure, and without using the Array#to_h method, 
#write some code that will return a hash where the key is the first item in each 
#sub array and the value is the second item.

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# # expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# new_hsh = {}
# arr.each do |sub_arr|
#   new_hsh[sub_arr[0]] = sub_arr[1]
# end

# Given the following data structure use a combination of methods, including 
# either the select or reject method, to return a new array identical in structure 
# to the original but containing only the integers that are multiples of 3.

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# arr.map do |sub_arr|
#   sub_arr.select do |int|
#    int % 3 == 0
#   end
# end

# Given the following data structure, return a new array containing the same 
# sub-arrays as the original but ordered logically by only taking into 
# consideration the odd numbers they contain.

# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# arr.sort_by do |sub_arr|
#   sub_arr.select do |int|
#     int % 2 != 0 # should be num.odd?
#   end
# end

# sorted = [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# Given this data structure write some code to return an array containing 
# the colors of the fruits and the sizes of the vegetables. 
# The sizes should be uppercase and the colors should be capitalized.

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# return = [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# new_arr = []
# hsh.each_value do |val|
#   if val[:type] == 'fruit'
#     val[:colors].each do |color|
#       color.capitalize!
#     end
#     new_arr  << val[:colors]
#   end
#   if val[:type] == 'vegetable'
#     new_arr << val[:size].upcase!
#   end
# end
# new_arr

# mysolutions are cheating, use transformative methods!

# Given this data structure write some code to return an array which contains 
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hsh|
  all_even = true
  hsh.each_value do |val|
    val.each do |int|
      if int.odd?
        puts int
        all_even = false
        break
      end
    end
  end
  all_even
end

    
  
