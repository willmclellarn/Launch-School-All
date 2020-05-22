# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# flint_array =  {}
# flintstones.each_with_index { |name, index|
#  flint_array[name] = index 
# }
# puts flint_array

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# age_sum = 0

# ages.each { |key, value|
#   age_sum += ages[key]
# }
# puts age_sum

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# ages.reject { |key, value|
#   ages[key] >= 100
# }



# #Pick out the minimum age from our current Munster family hash:
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# ages.values.min

# #Find the index of the first name that starts with "Be"
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# puts flintstones.index("Be")

#Amend this array so that the names are all shortened to just the first three characters:
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones.map { |name|
#   name = name[0,3]
#   puts name
# }
# puts flintstones

#Create a hash that expresses the frequency with which each letter occurs in this string:

# statement = "The Flintstones Rock"
# #{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
# freq_hash = {}
# statement.each { |letter|
#   if freq_hash.has_key?(letter)
#    freq_hash[key] += 1
#   else 
#     freq_hash[key] =1    
#   end
# }

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# words = "the flintstones rock"
# words.capitalize!
# puts words

# puts "starting"

# words.each_with_object (words) {|letter|
#   if letter == " "
#     title_letter_index = words.index(letter) + 1
#     # title_letter_index is now 4
#     puts words[4, -1]
    
#   end
# }
# puts words

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each { |key, value|
  if value["age"] <= 17
    value["age_group"] = "kid"
  else 
    if munsters[key]["age"] <= 64
    munsters[key]["age_group"] = "adult"
    else  
      munsters[key]["age_group"] = "senior"
    end
  end
  }
  puts munsters