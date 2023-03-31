require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'
require './lib/game'

game = Game.new
game.deal
game.start
