require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

#[(:suit, value, rank)]
#Create 2 deck of cards
game= Game.new
game.add_diamond_card
game.add_club_card
game.add_spade_card
game.add_heart_card

deck1 = Deck.new(game.create_deck)
deck2 = Deck.new(game.create_deck)

player1 = Player.new('Megan', deck1.shuffle)
player2 = Player.new('Aurora', deck2.shuffle)
