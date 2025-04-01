require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
#require 'pry'; binding.pry

# Create 52 Cards (A standard deck)
# Put those card into two Decks (some randomness would be nice here!)
# Create two players with the Decks you created
# Start the game using a new method called start

@game = Game.new
@game.start