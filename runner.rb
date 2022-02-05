
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

card1 = Card.new(:hearts, 'ace', 14)
card2 = Card.new(:hearts, '2', 2)
card3 = Card.new(:hearts, '3', 3)
card4 = Card.new(:hearts, '4', 4)
card5 = Card.new(:hearts, '5', 5)
card6 = Card.new(:hearts, '6', 6)
card7 = Card.new(:hearts, '7', 7)
card8 = Card.new(:hearts, '8', 8)
card9 = Card.new(:hearts, '9', 9)
card10 = Card.new(:hearts, '10', 10)
card11 = Card.new(:hearts, 'jack', 11)
card12 = Card.new(:hearts, 'queen', 12)
card13 = Card.new(:hearts, 'king', 13)
card14 = Card.new(:spaids, 'ace', 14)
card15 = Card.new(:spaids, '2', 2)
card16 = Card.new(:spaids, '3', 3)
card17 = Card.new(:spaids, '4', 4)
card18 = Card.new(:spaids, '5', 5)
card19 = Card.new(:spaids, '6', 6)
card20 = Card.new(:spaids, '7', 7)
card21 = Card.new(:spaids, '8', 8)
card22 = Card.new(:spaids, '9', 9)
card23 = Card.new(:spaids, '10', 10)
card24 = Card.new(:spaids, 'jack', 11)
card25 = Card.new(:spaids, 'queen', 12)
card26 = Card.new(:spaids, 'king', 13)
card27 = Card.new(:clubs, 'ace', 14)
card28 = Card.new(:clubs, '2', 2)
card29 = Card.new(:clubs, '3', 3)
card30 = Card.new(:clubs, '4', 4)
card31 = Card.new(:clubs, '5', 5)
card32 = Card.new(:clubs, '6', 6)
card33 = Card.new(:clubs, '7', 7)
card34 = Card.new(:clubs, '8', 8)
card35 = Card.new(:clubs, '9', 9)
card36 = Card.new(:clubs, '10', 10)
card37 = Card.new(:clubs, 'jack', 11)
card38 = Card.new(:clubs, 'queen', 12)
card39 = Card.new(:clubs, 'king' , 13)
card40 = Card.new(:diamonds, 'ace', 14)
card41 = Card.new(:diamonds, '2', 2)
card42 = Card.new(:diamonds, '3', 3)
card43 = Card.new(:diamonds, '4', 4)
card44 = Card.new(:diamonds, '5', 5)
card45 = Card.new(:diamonds, '6', 6)
card46 = Card.new(:diamonds, '7', 7)
card47 = Card.new(:diamonds, '8', 8)
card48 = Card.new(:diamonds, '9', 9)
card49 = Card.new(:diamonds, '10', 10)
card50 = Card.new(:diamonds, 'jack', 11)
card51 = Card.new(:diamonds, 'queen', 12)
card52 = Card.new(:diamonds, 'king', 13)

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
