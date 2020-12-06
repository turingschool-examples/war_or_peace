require './lib/game'
require './lib/player'
require './lib/deck'
require './lib/card'

def create_deck
  suits = [:heart, :diamond, :spade, :club]
  cards = []

  suits.each do |suit|
    (2..14).each do |number|
      cards << Card.new(suit, card_value(number), number)
    end
  end

  Deck.new(cards)
end

def card_value(rank)
    case rank
    when 14
      "Ace"
    when 13
      "King"
    when 12
      "Queen"
    when 11
      "Jack"
    else
      rank.to_s
    end
end

def print_welcome(player1, player2)
  puts "Welcome to War! (or Peace) This game will be played with 52 cards."
  puts "The players today are #{player1.name} and #{player2.name}."
  puts "Type 'GO' to start the game!"
  66.times { print '-' }
  puts ""
end

# Create a deck
full_deck = create_deck

# Shuffle it
full_deck.shuffle

# Assign it evenly among 2 players
middle_of_deck = full_deck.cards.length / 2
end_of_deck = full_deck.cards.length

p1_deck = Deck.new(full_deck.cards[0..middle_of_deck - 1])
p2_deck = Deck.new(full_deck.cards[middle_of_deck..end_of_deck - 1])

player1 = Player.new("Megan", p1_deck)
player2 = Player.new("Aurora", p2_deck)

# Welcome our user
print_welcome(player1, player2)
input = gets.chomp

# Let's play!
if (input == "GO")
  game = Game.new(player1, player2)
  game_over_message = game.start
  puts game_over_message
else
  puts "Maybe next time, then."
end



