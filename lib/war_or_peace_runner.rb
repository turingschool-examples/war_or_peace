require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
#welcome to the game

#create decks and shuffle them
deck1 = Deck.new
deck2 = Deck.new
deck1.new_deck
deck2.new_deck

#create players
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

#start game
new_game = Game.new
new_game.welcome

turn = Turn.new(player1, player2)


# require "pry"; binding.pry
