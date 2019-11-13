hsh1 = { "a" => 10, "b" => 20 }
contains = false
magic_value = 20

hsh1.each do |key, value| 
  if value == magic_value
    contains = true
    puts "Found it!"
  end
end

#should have used has_value?

#above still works...