require './lib/game'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

game = Game.new
puts start.greeting
start.begin_game(gets.chomp)
