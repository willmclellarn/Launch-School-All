 h = {a:1, b:2, c:3, d:4}
#1
puts h[:b]
#2
h[:e] = 5
puts h
#3
h.each do |k,v|
  if v < 3.5
    h.delete(k)
  end
end

puts h

#should have used h.delete_if