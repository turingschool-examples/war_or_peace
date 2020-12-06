require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

#create deck with 52 cards
deck = Deck.new
deck.new_deck

#create split decks with 26 cards each
deck1 = Deck.new
deck2 = Deck.new

#methods to put cards into two decks
#and shuffle them
deck1.cards << deck.cards[0..25]
deck2.cards << deck.cards[26..52]
deck1.cards = deck1.cards.flatten
deck2.cards = deck2.cards.flatten
deck1.cards.shuffle
deck2.cards.shuffle

#create players
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

#create turn
turn = Turn.new(player1, player2)

#start game
new_game = Game.new(turn)
new_game.start
