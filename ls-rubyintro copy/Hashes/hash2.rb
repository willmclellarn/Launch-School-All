hsh1 = { "a" => 10, "b" => 20 }
hsh2 = { "b" => 25, "c" => 30 }

new_hash = hsh1.merge(hsh2)
puts new_hash
puts hsh1

#hsh1 is the same

hsh1 = { "a" => 10, "b" => 20 }
hsh2 = { "b" => 25, "c" => 30 }

hsh1.merge!(hsh2)
puts hsh1

#hsh1 is different