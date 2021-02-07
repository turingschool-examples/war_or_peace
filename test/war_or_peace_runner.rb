require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
 # require "pry"; binding.pry

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

cue = "> "
start = nil
until (start == 'GO' || start == 'g')
    print cue
    start = gets.chomp
end

suits = [:spades, :hearts, :diamonds, :clubs]
values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
full_deck = []

suits.each do |suit|
  values.size.times {|r| full_deck << Card.new( suit, values[r], r+2 )}
end

full_deck = full_deck.shuffle.shuffle
deck1 = Deck.new([])
deck2 = Deck.new([])

player1 = Player.new('Meagan', deck1)
player2 = Player.new('Aurora', deck2)
turn = Turn.new(player1, player2)

26.times do |index|
  player1.deck.cards << full_deck.shift
  player2.deck.cards << full_deck.shift
end

game = Game.new(player1,player2)
game.start_a_war

# def start_a_war
#   line = 1
#   result = nil
#   # require "pry"; binding.pry
#   until player1.has_lost? == true || player2.has_lost? == true
#     turn = Turn.new(player1, player2)
#     result = turn.type
#     if result == :mutually_assured_destruction
#       victor = "No Winner"
#     else
#       victor = turn.winner
#     end
