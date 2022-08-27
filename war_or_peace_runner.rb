require_relative './lib/card.rb'
require_relative './lib/deck.rb'
require_relative './lib/player.rb'
require_relative './lib/turn.rb'
require_relative './lib/game.rb'
require_relative './lib/card_generator.rb'


cards = CardGenerator.new('cards.txt').cards

deck = cards

deck_1 = Deck.new(deck.shuffle.slice(0, 25))
deck_2 = Deck.new(deck.shuffle.slice(26, 51))

player_1 = Player.new("Megan", deck_1)
player_2 = Player.new("Aurora", deck_2)

game = Game.new(player_1, player_2)

game.start














