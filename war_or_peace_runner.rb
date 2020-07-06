require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'
require "pry"

filename = 'cards.txt'
cards = CardGenerator.new(filename).cards

cards.shuffle!
player_1_deck = Deck.new(cards.slice!(0, 26))
player_2_deck = Deck.new(cards.slice!(0, 26))

player_1 = Player.new("Megan", player_1_deck)
player_2 = Player.new("Aurora", player_2_deck)

game = Game.new(player_1, player_2)

game.start
