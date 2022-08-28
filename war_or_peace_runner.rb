require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'

#start the game
game = Game.new(player1, player2)
game.start
