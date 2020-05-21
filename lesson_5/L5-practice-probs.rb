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

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
#Given this previously seen family hash, print out the name, age and gender of each family member:

#(Name) is a (age)-year-old (male or female).

munsters.each_pair do |key, value|
  puts "#{key} is a #{value["age"]}-year-old #{value["gender"]}"
end
