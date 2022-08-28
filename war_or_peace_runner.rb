require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

game = Game.new('Jeff', 'Bob')
game.assign_base_deck(game.default_base_deck.shuffle)
game.start
