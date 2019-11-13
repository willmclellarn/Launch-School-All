arr = [1, 3, 5, 7, 9, 11]
number = 3

appears = false

arr.each do |num|
  if num == number
    appears = true
  end
end