# require 'minitest/autorun'
# require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'


# Card generator
ranks = %w{2 3 4 5 6 7 8 9 10 J Q K A}
suits = [:Spades, :Hearts, :Diamonds, :Clubs]
stack_of_cards = []
suits.each do |suit|
  ranks.size.times do |i|
    stack_of_cards << Card.new( suit, ranks[i], i+1 )
  end
end

stack_of_cards.shuffle

deck1 = Deck.new(stack_of_cards[0..25])
deck2 = Deck.new(stack_of_cards[26..51])

player1 = Player.new("Player 1", deck1)
player2 = Player.new("Player 2", deck2)

puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Player 1 and Player 2.
Type 'GO' to start the game!
------------------------------------------------------------------"
until gets.chomp == "GO"
  puts "Sorry, please type 'GO'. All caps. No period."
end
