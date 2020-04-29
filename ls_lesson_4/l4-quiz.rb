# numbers = [7, 3, 5, 2, 1, 8, 4]
# counter = 0

# loop do
#   number = numbers[counter]
#   # number = 7
#   counter = 0
#   # counter = 0 

#   loop do
#     counter += 1
#     puts counter

#     break if counter >= number
#   end

#   counter += 1
#   break if counter >= numbers.size
# end

def snake(str)
  words = str.split
  current_word = 0

  loop do
    words[current_word].downcase!

    current_word += 1
    break if current_word >= words.size
  end

  words.join('_')
end

sentence = 'The sky was blue'
puts snake(sentence) # => 'the_sky_was_blue'