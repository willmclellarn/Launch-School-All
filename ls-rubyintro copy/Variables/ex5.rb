x = 0
3.times do
  x += 1
end
puts x

#puts out x, which is value of 3

y = 0
3.times do
  y += 1
  x = y
end
puts x

#puts out nothing, throws an error, x was a local variable