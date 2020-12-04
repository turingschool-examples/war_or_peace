require_relative 'card_generator'
require_relative 'player'
require_relative 'game'
require 'pry'


card_generator = CardGenerator.new("cards.txt")
card_generator.create_cards
card_generator.create_decks
player1 = Player.new("Jenny", card_generator.deck1)
player2 = Player.new("Marisa", card_generator.deck2)
game = Game.new(player1, player2)
game.intro
game.start_game if game.got_answer
