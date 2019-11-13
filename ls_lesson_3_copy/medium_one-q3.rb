def factors(number)
  divisor = number #20
  factors = []
  while divisor > 0 do
  # begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end # end until divisor == 0
  factors
end

# number % divisor == 0 modulus is checking if the number has a
# remainder when divided. this is the key to it being a factor. its
# clean division if modulus = 0.

# returns factors array
