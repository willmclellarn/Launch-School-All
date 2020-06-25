def displayBoard(brd)
  puts ""
  puts "     |     |"
  puts "     |     |"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "     |     |"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "     |     |   "
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' '}
  new_board
end

board = initialize_board
displayBoard(board)
