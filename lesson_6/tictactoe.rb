require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "First to 5 wins the game."

  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ' '
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that's not a valid choice!"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  if find_winning_square(brd)
    brd[find_winning_square(brd)] = COMPUTER_MARKER
  elsif find_at_risk_square(brd)
    brd[find_at_risk_square(brd)] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]] # diagonals

  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
       return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

# joinor([1, 2])                   # => "1 or 2"
# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

def joinor(arr, separator = ", ", ending = "or")
  final_string = ""
  n = 0

  case arr.length()
    when 1
      final_string = arr[0].to_s
    when 2
      final_string = arr[0].to_s + " " + ending + " " + arr[1].to_s
    when 3..
      while n < (arr.length()-1)
        final_string += (arr[n].to_s) + separator
        n += 1
      end
      final_string += ending + " " + (arr[-1].to_s)
  end
end

def display_score(scores)
  puts "Player score is #{scores.count('Player')}. Computer score is #{scores.count('Computer')}. "
  return [scores.count('Player'),scores.count('Computer')].max
end

def find_at_risk_square(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]] # diagonals
  open_space = nil
  winning_lines.each do |line|
    counter = 0
    line.each do |num|
      if brd[num] == PLAYER_MARKER
        counter += 1
      end
    end
    if counter == 2
      open_space = line.select {|num| brd[num] == " "}[0]
    end
  end
  open_space
end

def find_winning_square(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]] # diagonals
  open_space = nil
  winning_lines.each do |line|
    counter = 0
    line.each do |num|
      if brd[num] == COMPUTER_MARKER
        counter += 1
      end
    end
    if counter == 2
      open_space = line.select {|num| brd[num] == " "}[0]
    end
  end
  open_space
end

# Begin program run
loop do
  scores = []
  loop do
    board = initialize_board
    loop do
      display_board(board)
      display_score(scores)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      winning_string = detect_winner(board)
      scores << winning_string
      prompt "#{winning_string} won this round!"
      sleep(1)
    else
      prompt "It's a tie!"
    end
  break if display_score(scores) >= 5
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  # End program run
end
