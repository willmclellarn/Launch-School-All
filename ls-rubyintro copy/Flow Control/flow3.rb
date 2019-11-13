puts "Hey bud, give me a number between 0-100..."
num = gets.chomp.to_i

if num < 0
  puts "no negative numbers pls"
end

if num >= 0 && num <= 50
  puts "0-50"
end

if num >= 51 && num <= 100
  puts "51-100"
end

if num > 100
  puts "over 100 ding dong"
end

