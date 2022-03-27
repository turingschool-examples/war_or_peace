require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Geraldine and Ivy."
p "Type 'GO' to start the game!"
p "----------------------------------------------------------------"

input = gets.chomp.upcase

if input != 'GO'
    p "Invalid input, type 'GO' if you'd like to start the game"
else
    new_game = Game.new(@player1, @player2)
    new_game.start
end








