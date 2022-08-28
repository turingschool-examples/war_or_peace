require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

game = Game.new
game.play

# There's no way this will function without finishing all the other things first, but here's to foolish optimism.