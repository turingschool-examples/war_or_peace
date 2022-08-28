require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'


  
card1 = Card.new(:spades, '1', 1)
card2 = Card.new(:spades, '2', 2)
card3 = Card.new(:spades, '3', 3)
card4 = Card.new(:spades, '4', 4)
card5 = Card.new(:spades, '5', 5)
card6 = Card.new(:spades, '6', 6)
card7 = Card.new(:spades, '7', 7)
card8 = Card.new(:spades, '8', 8)
card9 = Card.new(:spades, '9', 9)
card10 = Card.new(:spades, '10', 10)
card11 = Card.new(:spades, 'Jack', 11)
card12 = Card.new(:spades, 'Queen', 12)
card13 = Card.new(:spades, 'King', 13)

card14 = Card.new(:clubs, '1', 1)
card15 = Card.new(:clubs, '2', 2)
card16 = Card.new(:clubs, '3', 3)
card17 = Card.new(:clubs, '4', 4)
card18 = Card.new(:clubs, '5', 5)
card19 = Card.new(:clubs, '6', 6)
card20 = Card.new(:clubs, '7', 7)
card21 = Card.new(:clubs, '8', 8)
card22 = Card.new(:clubs, '9', 9)
card23 = Card.new(:clubs, '10', 10)
card24 = Card.new(:clubs, 'Jack', 11)
card25 = Card.new(:clubs, 'Queen', 12)
card26 = Card.new(:clubs, 'King', 13)

card27 = Card.new(:diamonds, '1', 1)
card28 = Card.new(:diamonds, '2', 2)
card29 = Card.new(:diamonds, '3', 3)
card30 = Card.new(:diamonds, '4', 4)
card31 = Card.new(:diamonds, '5', 5)
card32 = Card.new(:diamonds, '6', 6)
card33 = Card.new(:diamonds, '7', 7)
card34 = Card.new(:diamonds, '8', 8)
card35 = Card.new(:diamonds, '9', 9)
card36 = Card.new(:diamonds, '10', 10)
card37 = Card.new(:diamonds, 'Jack', 11)
card38 = Card.new(:diamonds, 'Queen', 12)
card39 = Card.new(:diamonds, 'King', 13)

card40 = Card.new(:hearts, '1', 1)
card41 = Card.new(:hearts, '2', 2)
card42 = Card.new(:hearts, '3', 3)
card43 = Card.new(:hearts, '4', 4)
card44 = Card.new(:hearts, '5', 5)
card45 = Card.new(:hearts, '6', 6)
card46 = Card.new(:hearts, '7', 7)
card47 = Card.new(:hearts, '8', 8)
card48 = Card.new(:hearts, '9', 9)
card49 = Card.new(:hearts, '10', 10)
card50 = Card.new(:hearts, 'Jack', 11)
card51 = Card.new(:hearts, 'Queen', 12)
card52 = Card.new(:hearts, 'King', 13)

deck1 = Deck.new([card1, card3, card5, card7, card9,
  card11, card13, card15, card17, card19, card21,
  card23, card25, card27, card29, card31, card33, 
  card35, card37, card39, card41, card43, card45, 
  card47, card49, card51])

deck2 = Deck.new([card52, card50, card48, card46, 
  card44, card42, card40, card38, card36, card34, 
  card32, card30, card28, card26, card24, card22, 
  card20, card18, card16, card14, card12, card10, 
  card8, card6, card4, card2])


player1 = Player.new("Megan", deck1)
player2 = Player.new("Auora", deck2)

turn = Turn.new(player1, player2)

turn.start
