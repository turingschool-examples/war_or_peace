require './lib/card_generator'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

filename = "cards.txt"

cards = CardGenerator.new(filename)

deck1 = Deck.new([
  card2, card4, card6, card8, card10, card11,
  card13, card15, card17, card16, card21, card22,
  card1, card26, card28, card29, card31, card33,
  card35, card37, card39, card41, card25, card44,
  card46, card52
])

deck2 = Deck.new([
  card24, card3, card5, card7, card9, card12,
  card14, card19, card18, card20, card23, card42,
  card27, card30, card32, card34, card36, card38,
  card40, card43, card45, card47, card49, card50,
  card51, card48
])

player1 = Player.new('Rupert', deck1)
player2 = Player.new('Winston', deck2)

turn = Turn.new(player1, player2)

turn.start
