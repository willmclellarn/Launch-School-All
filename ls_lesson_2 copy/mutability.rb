def fix(value)
  puts "initial object #{value.object_id}"
  value = value.upcase
  puts "upcased object #{value.object_id}"
  value.concat('!')
end

s = 'hello'
puts "original object #{s.object_id}"
t = fix(s)
puts "final object #{t.object_id}"