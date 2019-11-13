# ask the user for 2 numbers
# ask the user for the operation
# perform the operation on the two numbers
# display the results

# answer = Kernel.gets()
# Kernel.puts(answer)


def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

# Kernel.puts("=> Welcome to Calculator!")
prompt("Welcome to Calculator!")
loop do # main loop
  # Kernel.puts("=> What's the first number?")
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else 
      prompt("Hmmm...is that a valid number? Try again.")
    end
  end


  # Kernel.puts("What's the second number?")
  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else 
      prompt("Hmmm...is that a valid number? Try again.")
    end
  end

  # Kernel.puts(number1 + " " + number2)

  # Kernel.puts("What operation do you want to perform? 1) add 2) subtract 3) multiply 4) divide")
  prompt("What operation do you want to perform? 1) add 2) subtract 3) multiply 4) divide")
  operator = Kernel.gets().chomp()

  # if operator == '1'
  #   result = number1.to_i() + number2.to_i()
  # elsif operator == '2'
  #   result = number1.to_i() - number2.to_i()
  # elsif operator == '3'
  #   result = number1.to_i() * number2.to_i()
  # elsif operator == '4'
  #   result = number1.to_f() / number2.to_f()
  # end

  result = case operator
      when '1'
        number1.to_i() + number2.to_i()
      when '2'
        number1.to_i() - number2.to_i()
      when '3'
        number1.to_i() * number2.to_i()
      when '4'
        number1.to_f() / number2.to_f()
    end

  # Kernel.puts("The result is #{result}")
  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? Type Y if so.")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Calculator. Good bye!")