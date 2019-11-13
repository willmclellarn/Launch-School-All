# puts "Hey bud, give me a number between 0-100..."
# num = gets.chomp.to_i


# if num < 0
#   puts "no negative numbers pls"
# end

# if num >= 0 && num <= 50
#   puts "0-50"
# end

# if num >= 51 && num <= 100
#   puts "51-100"
# end

# if num > 100
#   puts "over 100 ding dong"
# end
def num_descriptor (num)
   case 
    when num < 0
      puts "no negative numbers pls"
    when num <= 50
      puts "0-50"
    when num <= 100
      puts "51-100"
    when num > 100
      puts "over 100 ding dong"
    end
end

num_descriptor(25)

