require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

# Generates the 52 Cards
card_generator = CardGenerator.new
card_generator.make_standard_deck

# Split deck into 2 decks and shuffle decks
shuffle_cards = card_generator.full_card_deck.shuffle
deck1 = Deck.new(shuffle_cards.slice(1..26))
deck2 = Deck.new(shuffle_cards.slice(27..52))

# Create two players
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

# Create a game with 2 players and call the start method on game
game = Game.new(player1, player2)
game.start
