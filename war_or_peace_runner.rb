# This is my runner file for War or Peace
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'

game = Game.new

game.start
