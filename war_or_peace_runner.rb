require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'
require 'rspec'
require 'pry'

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

user_input = gets.chomp
if user_input == "GO"
  new_game = Start.new
  new_game.new_game
else
  p "improper input"
end
