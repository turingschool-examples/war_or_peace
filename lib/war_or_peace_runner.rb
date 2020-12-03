require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
#what method is actually called when turn.start happens?
turn.start


puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are Megan and Aurora."
puts "Type 'GO' to start the game!""
"------------------------------------------------------------------"

input = gets.chomp.downcase
if input == 'go'
  turn.new
