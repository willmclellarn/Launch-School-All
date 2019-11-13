def to_zero(num)
  if num >= 0
    puts num
    num -= 1
    to_zero(num)
  end
end

to_zero(50)