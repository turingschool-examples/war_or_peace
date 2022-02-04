require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/gameplay'
require 'pry'


go = Gameplay.new
puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are Morgan and Aurora."
puts "Type 'GO' to starrt the game!"
puts "------------------------------------------------------------------"

ready = gets.chomp
if ready == 'go' || ready == 'GO' || ready == 'Go'
  go.start
else
  puts "You can't just enter #{ready} and expect something to happen."
end
