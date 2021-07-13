# Write a method that takes a string argument and
# returns a new string that contains the value of
# the original string with all consecutive duplicate
# characters collapsed into a single character.

# method(string)
# return value = new string
# new string has only 1 instance of any previous duplicate consecutive characters

# no_dupes('hhelllo') => 'helo'
# no_dupes('bbbbbb') => 'b'

# data structure, I think I will use an array
# Reason being, is I'd like to iterate over the array, store a current_char
# Then, compare the current_char to next_char
# If equal, delete next_char, move to next iteration
# IF not equal, change current_char to next_char, move to next iteration



def no_dupes(string)
  string_arr = string.split('')
  if string_arr.length <= 1
    return string
  else
    current_char = string_arr[0] # set current char
  end

  string_arr.each_index do |index|
    # edge cases when passed an array of 0 or 1 length
    if index == (string_arr.length - 1) # edge case at the end of the array
      break
    end
    next_char = string_arr[index] # set next_char
    # check if the chars are duplicated
    if current_char == next_char
      string_arr.delete_at(index+1)
    else current_char = next_char
    end
  end
  # return the pruned array, transformed into a string
  return string_arr.join.to_s
end

puts no_dupes('hhelllo')
puts no_dupes('bbbbbb')
