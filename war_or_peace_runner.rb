require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require "pry"
@game = Game.new(@player1, @player2)

@game.start
