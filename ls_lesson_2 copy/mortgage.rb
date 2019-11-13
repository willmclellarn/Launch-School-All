# pseudo code (with logic)
# first, prompt the user for the 3 inputs, loan amount, apr, duration
# second, validate the inputs are of the right data type
# plug the variables into a compute function that does the math
# surface the desired data in the right format (monthly interest rate + monthly duration)


# global variables
loan_amount = 0
apr = 0
loan_duration = 0 #(years)

# global functions
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def valid_percent?(num)
    new_num = num.to_f
    if new_num != 0 && new_num > 0 && new_num < 1
      return true
    end
end


# get and validate loan amount
loop do
  prompt("How big is your loan, in dollars?")
  loan_amount_string = Kernel.gets().chomp()
    if valid_number?(loan_amount_string)
      loan_amount = loan_amount_string.to_i # convert loan amount to data type: number so we can use it calcuations
      break
    else prompt ("That's not a proper number. Try again.")
    end
end

loop do
  prompt("What's your APR?")
  apr_string = Kernel.gets().chomp()
    if valid_percent?(apr_string)
      apr = apr_string.to_f
      break
    else prompt ("That's not a proper percent. Try again.")
    end
end

loop do
  prompt("What's your loan duration, in years?")
  loan_duration_string = Kernel.gets().chomp()
    if valid_number?(loan_duration_string)
      loan_duration = loan_duration_string.to_i
      break
    else prompt ("That's not a proper percent. Try again.")
    end
end

# puts loan_amount
# puts apr
# puts loan_duration

monthly_loan_duration = loan_duration * 12
monthly_interest = apr/12
monthly_payment = 0

monthly_payment = loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**(-monthly_loan_duration)))

prompt("Your monthly payment is $#{monthly_payment}! Good luck paying that sucker off :)")



