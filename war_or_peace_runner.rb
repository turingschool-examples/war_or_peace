require './lib/game'
require './lib/player'
require 'pry'

player1 = Player.new('Sally')
player2 = Player.new('James')
player1.deck.shuffle
player2.deck.shuffle
game = Game.new(player1, player2)
game.play
