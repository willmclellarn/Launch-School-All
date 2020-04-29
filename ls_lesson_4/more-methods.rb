# { a: "ant", b: "bear", c: "cat" }.any? do |key, value|
#   value.size > 4
# end

# { a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
#   puts "The index of #{pair} is #{index}."
# end

# # The index of [:a, "ant"] is 0.
# # The index of [:b, "bear"] is 1.
# # The index of [:c, "cat"] is 2.
# # => { :a => "ant", :b => "bear", :c => "cat" }

# [1, 2, 3].each_with_object([]) do |num, array|
#   array << num if num.odd?
# end
# # => [1, 3]

long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
  value.size > 3
end
puts long

# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]