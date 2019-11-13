
VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_LETTERS = %w(r p sc l sp)
player_wins = 0
computer_wins = 0

def mutate_letter_choice(choice)
  full_choice = VALID_CHOICES[VALID_LETTERS.index(choice)]
  choice.clear
  choice << full_choice
end

def is_valid? (choice)
  if VALID_CHOICES.include?(choice)
    return true
  elsif VALID_LETTERS.include?(choice)
    # puts VALID_LETTERS.index(choice)
    # puts VALID_CHOICES[VALID_LETTERS.index(choice)]
    mutate_letter_choice(choice)
  return true
  else return false
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  winning_combos = 
    {"rock" => ["scissors", "lizard"],
    "paper" => ["rock", "spock"],
    "scissors" => ["paper", "lizard"],
    "spock" => ["rock", "scissors"],
    "lizard" => ["paper", "spock"]}
    winning_combos[first].include? second
end

def display_results(player, computer, player_wins, computer_wins)
    if (win?(player, computer) && player_wins < 5)
      prompt("You won!")
    elsif player_wins == 5
      prompt("Damn playa! You won 5")
    elsif win?(computer, player) && computer_wins < 5
      prompt("Computer won!")
    elsif computer_wins == 5
      prompt("Damn computa! You won 5")
    else
      prompt("It's a tie")
    end
end

# def update_score(player, computer, player_wins, computer_wins)
#   if win?(player, computer)
#     player_wins = player_wins + 1
#     puts player_wins
#   end
# end

while player_wins < 5 && computer_wins < 5
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    if is_valid?(choice)
      break
    else
      prompt("That's not a valid choice. Try again. Recall, you can't use s, use sc or sp.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose #{choice}; Computer chose #{computer_choice}")
  
  if win?(choice, computer_choice)
    player_wins += 1
  elsif win?(computer_choice, choice)
    computer_wins += 1
  end
  puts player_wins
  puts computer_wins
   
  display_results(choice, computer_choice, player_wins, computer_wins)

  if player_wins == 5 || computer_wins == 5
    break
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
