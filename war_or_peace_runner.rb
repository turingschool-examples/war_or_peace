require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

full_deck = Deck.new([])
full_deck.populate
full_deck.shuffle_and_deal
player1 = Player.new('Megan', full_deck.deck1)
player2 = Player.new('Aurora', full_deck.deck2)
game = Game.new
game.start