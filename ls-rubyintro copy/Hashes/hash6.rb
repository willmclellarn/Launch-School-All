

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

words_combo = {}

words.each do |word|
 key = word.split('').sort.join
 if words_combo.has_key?(key)
  words_combo[key].push(word)
 else
  words_combo[key] = [word]
 end
end

p words_combo

words_combo.each_value do |value|
  # puts value
  puts "-------"
  p value
end







#   words_combo[key].push(word)
# else
#   words_combo[key] = word
#  end
#  # puts words_combo
# end

