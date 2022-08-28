require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/player'
require './lib/game'
require './lib/card_generator'

# Generate and shuffle cards
card_generator = CardGenerator.new
card_generator.run
# card_generator.shuffle

# Save deck for troubleshooting a crash
card_generator.save_deck

# Load bad deck for testing, if needed.
# card_generator.load_deck

# Create two decks
deck_1 = Deck.new(card_generator.cards[0, 26])
deck_2 = Deck.new(card_generator.cards[26, 26])

# Create two players
player_1 = Player.new('Megan', deck_1)
player_2 = Player.new('Aurora', deck_2)

# Create one turn
turn = Turn.new(player_1, player_2)

# Create one game
game = Game.new(turn)

# Start
puts 'Welcome to War! (or Peace). This game will be played with 52 cards.'
puts "The players today are #{player_1.name} and #{player_2.name}."
game.start