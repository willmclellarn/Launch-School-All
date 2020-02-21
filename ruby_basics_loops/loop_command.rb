loop do
    puts 'Should I stop looping?'
    answer = gets.chomp
    low_answer = answer.downcase
    puts low_answer
    break if low_answer == "yes" 
  end