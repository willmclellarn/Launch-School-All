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

def display_first_cards(player_cards, dealer_cards)
  puts ''
  puts 'Player Cards are: '
  player_cards.each do |card|
    puts card.join(' of ')
  end
  puts ''
  puts 'Dealer Cards:'
  dealer_cards.each do |card|
    puts card.join(' of ')
  end
  puts ''
end

def player_turn(cards, deck)
  loop do
    puts "Would you like to hit or stay?"
    answer = gets.chomp
    if answer != 'stay'
      deal_card(cards, deck)
    end 
    display_cards(cards)
    break if answer == 'stay' || busted?(cards)
  end
end

def busted?(cards)
  if get_blackjack_value(cards) > 21
     true
  else false
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
  puts 'Live Cards are: '
  cards.each do |card|
    puts card.join(' of ')
  end
end

def dealer_turn(cards, deck)
  while get_blackjack_value(cards) < 17
    puts "Dealer currently has #{get_blackjack_value(cards)}"
    deal_card(cards, deck)
    display_cards(cards)
  end
  puts "The Dealer ended up with #{get_blackjack_value(cards)}"
  if busted?(cards)
    puts "The Dealer busted!"
  end
end

def compare_scores(player_score, dealer_score)
  if player_score == 21
    return "Player won!"
  elsif player_score == dealer_score
    return "Tie game :)"
  elsif dealer_score > player_score
    return "Dealer won!"
  else return "Player won!"
  end
end

#--- Begin Program Run -----
loop do
  deck = initialize_deck
  # created the deck

  puts 'Welcome to 21!'
  player_cards = deal_first_cards(deck)
  dealer_cards = deal_first_cards(deck)
  # created some hands

  display_first_cards(player_cards, dealer_cards)
  # show the hands

  player_turn(player_cards, deck)
  # let the playa play
  if busted?(player_cards)
    puts 'Want to play again?'
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end

  player_score = get_blackjack_value(player_cards)
  # store the score (it can't be over 21)

  puts "Player is staying at #{player_score}"
  puts "Now, it's the dealer's turn..."
  puts " "
  dealer_turn(dealer_cards, deck)
  #let the dealer play

  dealer_score = get_blackjack_value(dealer_cards)
  # store the dealer's score (it can be over 21)

  if player_score && dealer_score <= 21
    puts "#{(compare_scores(player_score,dealer_score))} won!"
    puts 'Want to play again?'
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end
# End Program Run