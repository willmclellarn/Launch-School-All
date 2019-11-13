my_array = [1,2,5,10,20]
old_array = []

my_array.select do |num|  
  old_array.push(num)
  num += 2
end