
#example for each on an array
[1, 2, 3].each do |num|
  puts num
end

#example for .each method on a hash
hash = { a: 1, b: 2, c: 3 }
hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}"
end

#.select method => returns a NEW ARRAY
[1, 2, 3].select do |num|
  num.odd?
end