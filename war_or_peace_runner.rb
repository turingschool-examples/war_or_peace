require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/turn'
require_relative 'lib/game'


game = Game.new
shuffled_cards = game.cards

# p shuffled_cards
