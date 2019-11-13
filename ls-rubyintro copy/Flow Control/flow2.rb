def upper10(string)
  if string.length > 10
    return string.upcase
  else puts "Your string is too short"
  end
end

puts upper10("hi")
