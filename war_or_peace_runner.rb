require './lib/deck_generator'
require './lib/game'

deck_of_cards = DeckGenerator.new.generate_deck.cards.shuffle!

Game.new(deck_of_cards: deck_of_cards).start
