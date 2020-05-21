# [[1, 2], [3, 4]].map do |arr|
#   puts arr.first
#   arr.first
# end

# my_arr = [[18, 7], [3, 12]].each do |arr|
#   arr.each do |num|
#     if num > 5
#       puts num
#     end
#   end
# end

# [[1, 2], [3, 4]].map do |arr|
#   arr.map do |num|
#     num * 2
#   end
# end

# [[1, 2], [3, 4]].map do |arr|
#   [2,4]
# end
# => [[2,4], [2,4]]

# [{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
# #{ a: 'ant', b: 'elephant' }
#   hash.all? do |key, value|
#     value[0] == key.to_s
#   end
# end
# # => [{ :c => "cat" }]

# [[8, 13, 13], ['appless', 'banana', 'cantaloupe']].map do |arr|
#   arr.select do |item|
#     if item.to_s.to_i == item    # if it's an integer
#       item > 13
#     else
#       item.size < 6
#     end
#   end
# end


# [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
#   #[[1], [2], [3], [4]], [['a'], ['b'], ['c']]
#   element1.each do |element2|
#     #[1]
#     element2.partition do |element3|
#       #1
#       element3.size > 0
#     end
#   end
# end
# # => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  #[1, 2], [3, 4]
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

#=> [[[2,3],[4,5]],[6,7]]