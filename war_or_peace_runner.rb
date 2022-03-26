require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

puts "Enter name of player 1"
player1 = gets.chomp
puts "Enter name of player 2"
player2 = gets.chomp

p "Welcome to War (or Peace) This game will be played with 52 cards.
The players today are #{player1} and #{player2}.
Type 'GO' to start the game!"

action = gets.chomp

if action.upcase == "GO"
  p "Game will start (when coded)"
else
  p "wrong word "
end
