require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
#welcome to the game

#create decks and shuffle them
deck = Deck.new
deck.new_deck

#create split decks
deck1 = Deck.new
deck2 = Deck.new

#put cards into split decks
deck1.cards << deck.cards[0..25]
deck2.cards << deck.cards[26..52]
deck1.cards = deck1.cards.flatten
deck2.cards = deck2.cards.flatten
deck1.cards.shuffle
deck2.cards.shuffle

#create players
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

turn = Turn.new(player1, player2)
#start game
new_game = Game.new(turn)
# require "pry"; binding.pry
new_game.start
