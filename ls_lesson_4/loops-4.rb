counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end