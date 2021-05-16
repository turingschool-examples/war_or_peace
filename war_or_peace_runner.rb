require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

#[(:suit, value, rank)]
#Create a deck of cards split between two players
game= Game.new
game.add_diamond_card
game.add_club_card
game.add_spade_card
game.add_heart_card
cards = game.create_deck.shuffle
cards1 = cards.slice(0..25)
cards2 = cards.slice(26..52)

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

turn = Turn.new(player1, player2)

#start the game
turn.start
