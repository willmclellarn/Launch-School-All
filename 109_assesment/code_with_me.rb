# find the index N that makes sum of integers (aka elements)
# with index < N == to sum of integers with index > N

# interate over indices of the Array
# run function to check left side sum
# run function to check right side sum
# compare the two, if equal, return the index
# if not equal, step to the next index
# if loop finishes, return -1
def compute_left_sum(arr, index)
  if index == 0
    return 0
  else arr[0..(index - 1)].sum
  end
end

def compute_right_sum(arr, index)
  if index == (arr.length - 1)
    return 0
  else arr[(index + 1)..-1].sum
  end
end

def find_even_index(arr)
  arr.each_index do |index|
    left_sum = compute_left_sum(arr, index)
    right_sum = compute_right_sum(arr, index)
    if left_sum == right_sum
      return index
    end
  end
  return -1
end



# test cases
p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
