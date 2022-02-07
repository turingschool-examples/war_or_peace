require './lib/game'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

game = Game.new
puts game.greeting
game.begin_game(gets.chomp)
