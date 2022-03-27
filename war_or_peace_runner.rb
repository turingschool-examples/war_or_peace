require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

puts "Enter name of player 1"
player1_name = gets.chomp
puts "Enter name of player 2"
player2_name = gets.chomp

# p "Welcome to War (or Peace) This game will be played with 52 cards."
# p "The players today are #{player1_name} and #{player2_name}."
# p "Type 'GO' to start the game!"

action = gets.chomp

full_deck = Game.make_deck
puts full_deck

random_deck = full_deck.shuffle

#
# if action.upcase == "GO"
#
# else
#   p "wrong word"
# end
