require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are Megan and Aurora."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"

input = gets.chomp.downcase
if input == "go"
  Game.new.start
end
