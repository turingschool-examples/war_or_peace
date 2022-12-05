require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
game = Game.new
game.opening_message
game.deck_of_cards
game.set_up
game.start