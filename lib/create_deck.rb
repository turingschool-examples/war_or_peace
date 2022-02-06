require './lib/card'
require './lib/deck'
require './lib/player'


card1 = Card.new(:diamond, '2', 2)
card2 = Card.new(:diamond, '3', 3)
card3 = Card.new(:diamond, '4', 4)
card4 = Card.new(:diamond, '5', 5)
card5 = Card.new(:diamond, '6', 6)
card6 = Card.new(:diamond, '7', 7)
card7 = Card.new(:diamond, '8', 8)
card8 = Card.new(:diamond, '9', 9)
card9 = Card.new(:diamond, '10', 10)
card10 = Card.new(:diamond, 'Jack', 11)
card11 = Card.new(:diamond, 'Queen', 12)
card12 = Card.new(:diamond, 'King', 13)
card13 = Card.new(:diamond, 'Ace', 14)
card14 = Card.new(:spade, '2' ,2)
card15 = Card.new(:spade, '3', 3)
card16 = Card.new(:spade, '4', 4)
card17 = Card.new(:spade, '5', 5)
card18 = Card.new(:spade, '6', 6)
card19 = Card.new(:spade, '7', 7)
card20 = Card.new(:spade, '8', 8)
card21 = Card.new(:spade, '9', 9)
card22 = Card.new(:spade, '10', 10)
card23 = Card.new(:spade, 'Jack', 11)
card24 = Card.new(:spade, 'Queen', 12)
card25 = Card.new(:spade, 'King', 13)
card26 = Card.new(:spade, 'Ace', 14)
card27 = Card.new(:heart, '2', 2)
card28 = Card.new(:heart, '3', 3)
card29 = Card.new(:heart, '4', 4)
card30 = Card.new(:heart, '5', 5)
card31 = Card.new(:heart, '6', 6)
card32 = Card.new(:heart, '7', 7)
card33 = Card.new(:heart, '8', 8)
card34 = Card.new(:heart, '9', 9)
card35 = Card.new(:heart, '10', 10)
card36 = Card.new(:heart, 'Jack', 11)
card37 = Card.new(:heart, 'Queen', 12)
card38 = Card.new(:heart, 'King', 13)
card39 = Card.new(:heart, 'Ace', 14)
card40 = Card.new(:club, '2', 2)
card41 = Card.new(:club, '3', 3)
card42 = Card.new(:club, '4', 4)
card43 = Card.new(:club, '5', 5)
card44 = Card.new(:club, '6', 6)
card45 = Card.new(:club, '7', 7)
card46 = Card.new(:club, '8', 8)
card47 = Card.new(:club, '9', 9)
card48 = Card.new(:club, '10', 10)
card49 = Card.new(:club, 'Jack', 11)
card50 = Card.new(:club, 'Queen', 12)
card51 = Card.new(:club, 'King', 13)
card52 = Card.new(:club, 'Ace', 14)

unshuffled_deck = [card1 = Card.new(:diamond, '2', 2),
card2 = Card.new(:diamond, '3', 3),
card3 = Card.new(:diamond, '4', 4),
card4 = Card.new(:diamond, '5', 5),
card5 = Card.new(:diamond, '6', 6),
card6 = Card.new(:diamond, '7', 7),
card7 = Card.new(:diamond, '8', 8),
card8 = Card.new(:diamond, '9', 9),
card9 = Card.new(:diamond, '10', 10),
card10 = Card.new(:diamond, 'Jack', 11),
card11 = Card.new(:diamond, 'Queen', 12),
card12 = Card.new(:diamond, 'King', 13),
card13 = Card.new(:diamond, 'Ace', 14),
card14 = Card.new(:spade, '2' ,2),
card15 = Card.new(:spade, '3', 3),
card16 = Card.new(:spade, '4', 4),
card17 = Card.new(:spade, '5', 5),
card18 = Card.new(:spade, '6', 6),
card19 = Card.new(:spade, '7', 7),
card20 = Card.new(:spade, '8', 8),
card21 = Card.new(:spade, '9', 9),
card22 = Card.new(:spade, '10', 10),
card23 = Card.new(:spade, 'Jack', 11),
card24 = Card.new(:spade, 'Queen', 12),
card25 = Card.new(:spade, 'King', 13),
card26 = Card.new(:spade, 'Ace', 14),
card27 = Card.new(:heart, '2', 2),
card28 = Card.new(:heart, '3', 3),
card29 = Card.new(:heart, '4', 4),
card30 = Card.new(:heart, '5', 5),
card31 = Card.new(:heart, '6', 6),
card32 = Card.new(:heart, '7', 7),
card33 = Card.new(:heart, '8', 8),
card34 = Card.new(:heart, '9', 9),
card35 = Card.new(:heart, '10', 10),
card36 = Card.new(:heart, 'Jack', 11),
card37 = Card.new(:heart, 'Queen', 12),
card38 = Card.new(:heart, 'King', 13),
card39 = Card.new(:heart, 'Ace', 14),
card40 = Card.new(:club, '2', 2),
card41 = Card.new(:club, '3', 3),
card42 = Card.new(:club, '4', 4),
card43 = Card.new(:club, '5', 5),
card44 = Card.new(:club, '6', 6),
card45 = Card.new(:club, '7', 7),
card46 = Card.new(:club, '8', 8),
card47 = Card.new(:club, '9', 9),
card48 = Card.new(:club, '10', 10),
card49 = Card.new(:club, 'Jack', 11),
card50 = Card.new(:club, 'Queen', 12),
card51 = Card.new(:club, 'King', 13),
card52 = Card.new(:club, 'Ace', 14)]

shuffled_deck = unshuffled_deck.shuffle

p1_deck = shuffled_deck.slice!(1, 26).to_a
p2_deck = shuffled_deck.slice!(1, 26).to_a
deck1 = Deck.new(p1_deck)
deck2 = Deck.new(p2_deck)

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)



# require 'pry'; binding.pry











# deck1 = Deck.new([card1, card3, card5, card7, card9, card11, card13, card15, card17, card19, card21, card23, card25, card27, card29, card31, card33, card35, card37, card39, card41, card43, card45, card47, card49, card51].shuffle)
# deck2 = Deck.new([card2, card4, card6, card8, card10, card12, card14, card16, card18, card20, card22, card24, card26, card28, card30, card32, card34, card36, card38, card40, card42, card44, card46, card48, card50, card52].shuffle)
