my_pet_array = ["cat", "dog", "turtle"]

my_pet_array.each_with_index do |pet, index|
  puts "#{index} and #{pet}"
end