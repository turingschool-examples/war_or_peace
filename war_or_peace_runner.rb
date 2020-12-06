require './lib/card_generator'
require './lib/game'


filename = "cards.txt"
deck = CardGenerator.new(filename).cards

new_game = Game.new(deck)

new_game.start("Angel", "Amber")
