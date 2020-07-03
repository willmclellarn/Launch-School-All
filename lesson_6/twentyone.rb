# twentyone.rb
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
require 'pry'

def initialize_deck
  deck = []
  values = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']
  suits = ['Spades', 'Clubs', 'Hearts', 'Diamonds']

  values.each do |value|
    suits.each do |suit|
      deck << [value, suit]
    end
  end
  deck
end

def deal_first_cards(deck)
  card = deck.sample
  deck.delete(card)
  card2 = deck.sample
  deck.delete(card2)
  return [card, card2]
end

def display_first_cards(player_cards, computer_cards)
  puts ''
  puts 'Player Cards are: '
  player_cards.each do |card|
    puts card.join(' of ')
  end
  puts ''
  puts 'Computer Cards:'
  computer_cards.each do |card|
    puts card.join(' of ')
  end
end

def player_turn(cards, deck)
  loop do
    display_cards(cards)
    puts "Would you like to hit or stay?"
    answer = gets.chomp
    break if answer == 'stay'
    deal_card(cards, deck)
    display_cards(cards)
    break if busted?(cards)
  end
  
  if busted?(cards)
    puts 'Want to play again?'
  end

end

def busted?(cards)
  if get_blackjack_value(cards) > 21
    return true
  else return false
  end
end

def get_blackjack_value(cards)
  value = []
  aces = []
  cards.each do |card|
    if card[0].is_a? Integer
      value << card[0]
    elsif card[0] != 'Ace'
      value << 10
    elsif card[0] == 'Ace' && aces.empty?
      aces << 11
    else
      aces << 1
    end
  end
  pre_ace_total = value.sum
  ace_total = aces.sum
  hand_total = pre_ace_total + ace_total

  if hand_total > 21 && aces.any?
    aces[0] = 1
    hand_total = aces.sum + pre_ace_total
  end
  return hand_total
end

def deal_card(cards, deck)
  card = deck.sample
  deck.delete(card)
  cards << card
end

def display_cards(cards)
  puts ''
  puts 'Current Cards are: '
  cards.each do |card|
    puts card.join(' of ')
  end
end

def dealer_turn(cards, deck)
  while get_blackjack_value(cards) < 17
    puts "Dealer currently has #{get_blackjack_value(cards)}"
    deal_card(cards, deck)
  end
  puts "The Dealer ended up with #{get_blackjack_value(cards)}"
end

def compare_cards(computer_cards, player_cards)
  if get_blackjack_value(computer_cards) > 21 || get_blackjack_value(player_cards) == 21 || get_blackjack_value
    puts "Player won!"
  elsif get_blackjack_value(computer_cards) == get_blackjack_value(player_cards)
    puts "Push, it's a tie boys and girls!"
  elsif get_blackjack_value(computer_cards) > get_blackjack_value(player_cards)
    puts "Player"

end

# Begin Program Run

deck = initialize_deck
puts 'Welcome to 21!'
player_cards = deal_first_cards(deck)
computer_cards = deal_first_cards(deck)
display_first_cards(player_cards, computer_cards)
player_turn(player_cards, deck)
if get_blackjack_value(player_cards) <= 21
  puts "Player is staying at #{get_blackjack_value(player_cards)}"
  puts "Now, it's the dealer's turn..."
  puts " "
  dealer_turn(computer_cards, deck)
end
compare_cards(computer_cards,player_cards)

# End Program Run