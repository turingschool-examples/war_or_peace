require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/standard_deck"

# Create 52 Cards (A standard deck)
all_cards_info = {
  "ranks" => [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
  "values" => ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"],
  "suits" => [:heart, :diamond, :spade, :club]
  }

standard_deck = StandardDeck.new(all_cards_info)

num_of_cards = (1..52).to_a
cards = []

  cards.map do |card|
    require "pry"; binding.pry
  end
# Put those card into two Decks (some randomness would be nice here!)

# Create two players with the Decks you created

# Start the game using a new method called start
# This method will need to be included in a class - it is up to you which class to include it in - either existing or ✨new ✨
