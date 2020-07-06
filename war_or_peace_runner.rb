require './lib/card_generator'
require './lib/game'

cards = Card_Generator.new('cards.txt').cards
shuffled_cards = cards.shuffle
game = Game.new(shuffled_cards)
game.start
