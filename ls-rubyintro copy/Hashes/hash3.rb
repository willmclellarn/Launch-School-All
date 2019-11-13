hsh1 = { "a" => 10, "b" => 20 }

hsh1.each{|key, value| puts key}
hsh1.each{|key, value| puts value}

hsh1.each{|key, value| puts "#{key} of #{value}"}