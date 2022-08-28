require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'


  

card1 = Card.new(:spades, '2', 2)
card2 = Card.new(:spades, '3', 3)
card3 = Card.new(:spades, '4', 4)
card4 = Card.new(:spades, '5', 5)
card5 = Card.new(:spades, '6', 6)
card6 = Card.new(:spades, '7', 7)
card7 = Card.new(:spades, '8', 8)
card8 = Card.new(:spades, '9', 9)
card9 = Card.new(:spades, '10', 10)
card10 = Card.new(:spades, 'Jack', 11)
card11 = Card.new(:spades, 'Queen', 12)
card12 = Card.new(:spades, 'King', 13)
card13 = Card.new(:spades, 'Ace', 14)

card14 = Card.new(:clubs, '2', 2)
card15 = Card.new(:clubs, '3', 3)
card16 = Card.new(:clubs, '4', 4)
card17 = Card.new(:clubs, '5', 5)
card18 = Card.new(:clubs, '6', 6)
card19 = Card.new(:clubs, '7', 7)
card20 = Card.new(:clubs, '8', 8)
card21 = Card.new(:clubs, '9', 9)
card22 = Card.new(:clubs, '10', 10)
card23 = Card.new(:clubs, 'Jack', 11)
card24 = Card.new(:clubs, 'Queen', 12)
card25 = Card.new(:clubs, 'King', 13)
card26 = Card.new(:clubs, 'Ace', 14)

card27 = Card.new(:diamonds, '2', 2)
card28 = Card.new(:diamonds, '3', 3)
card29 = Card.new(:diamonds, '4', 4)
card30 = Card.new(:diamonds, '5', 5)
card31 = Card.new(:diamonds, '6', 6)
card32 = Card.new(:diamonds, '7', 7)
card33 = Card.new(:diamonds, '8', 8)
card34 = Card.new(:diamonds, '9', 9)
card35 = Card.new(:diamonds, '10', 10)
card36 = Card.new(:diamonds, 'Jack', 11)
card37 = Card.new(:diamonds, 'Queen', 12)
card38 = Card.new(:diamonds, 'King', 13)
card39 = Card.new(:diamons, 'Ace', 13)

card40 = Card.new(:hearts, '2', 2)
card41 = Card.new(:hearts, '3', 3)
card42 = Card.new(:hearts, '4', 4)
card43 = Card.new(:hearts, '5', 5)
card44 = Card.new(:hearts, '6', 6)
card45 = Card.new(:hearts, '7', 7)
card46 = Card.new(:hearts, '8', 8)
card47 = Card.new(:hearts, '9', 9)
card48 = Card.new(:hearts, '10', 10)
card49 = Card.new(:hearts, 'Jack', 11)
card50 = Card.new(:hearts, 'Queen', 12)
card51 = Card.new(:hearts, 'King', 13)
card52 = Card.new(:hearts, 'Ace', 14)

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
