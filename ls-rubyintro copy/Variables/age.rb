puts "How old are you?"
age = gets.chomp.to_i
years = 10
3.times do
  age += 10
  puts "In #{years} years you will be #{age}"
  years += 10
end

