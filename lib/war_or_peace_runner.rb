require '../lib/card'
require '../lib/deck'
require '../lib/player'
require '../lib/turn'
require '../lib/war_and_peace_final'
require 'pry'

game = WarAndPeaceRunner.new

decks = game.create_decks
player1 = Player.new("Megan", decks[0])
player2 = Player.new("Aurora", decks[1])

game.start(player1, player2)
