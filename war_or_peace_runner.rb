require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn.rb'
require './lib/game.rb'
require "pry"


deck_whole =
  [card1 = Card.new(:heart, 'Jack', 11),
    card2 = Card.new(:heart, '10', 10),
    card3 = Card.new(:heart, '9', 9),
    card4 = Card.new(:diamond, 'Jack', 11),
    card5 = Card.new(:heart, '8', 8),
    card6 = Card.new(:diamond, 'Queen', 12),
    card7 = Card.new(:heart, '3', 3),
    card8 = Card.new(:diamond, '2', 2),
    card9 = Card.new(:club, 'Jack', 11),
    card10 = Card.new(:spade , 'Queen', 12),
    card11 = Card.new(:club , '9', 9),
    card12 = Card.new(:heart , '4', 4),
    card13 = Card.new(:spade, '7', 7),
    card14 = Card.new(:diamond, '10', 10),
    card15 = Card.new(:diamond, 'King', 13),
    card16 = Card.new(:diamond, 'Ace', 14),
    card17 = Card.new(:club, '4', 4),
    card18 = Card.new(:spade, '9', 9),
    card19 = Card.new(:heart, 'Queen', 12),
    card20 = Card.new(:club, '7', 7),
    card21 = Card.new(:spade, '8', 8),
    card22 = Card.new(:diamond, '9', 9),
    card23 = Card.new(:spade, 'King', 13),
    card24 = Card.new(:diamond, '5', 5),
    card25 = Card.new(:club, '8', 8),
    card26 = Card.new(:club, '10', 10),
    card27 = Card.new(:spade, '5', 5),
    card28 = Card.new(:club, '6', 6),
    card29 = Card.new(:heart, '7', 7),
    card30 = Card.new(:diamond, '8', 8),
    card31 = Card.new(:spade, 'Ace', 14),
    card32 = Card.new(:spade, 'Jack', 11),
    card33 = Card.new(:heart, '5', 5),
    card34 = Card.new(:heart, 'King', 13),
    card35 = Card.new(:club, '5', 5),
    card36 = Card.new(:diamond, '6', 6),
    card37 = Card.new(:diamond, '3', 3),
    card38 = Card.new(:spade, '10', 10),
    card39 = Card.new(:spade, '4', 4),
    card40 = Card.new(:spade, '6', 6),
    card41 = Card.new(:spade, '3', 3),
    card42 = Card.new(:heart, '6', 6),
    card43 = Card.new(:spade, '2', 2),
    card44 = Card.new(:diamond, '4', 4),
    card45 = Card.new(:diamond, '7', 7),
    card46 = Card.new(:club, 'Ace', 14),
    card47 = Card.new(:heart, '2', 2),
    card48 = Card.new(:heart, 'Ace', 14),
    card49 = Card.new(:club, '3', 3),
    card50 = Card.new(:club, 'King', 13),
    card51 = Card.new(:club, 'Queen', 12),
    card52 = Card.new(:club, '2', 2)]

deck1 = Deck.new(deck_whole[0..25].shuffle)
deck2 = Deck.new(deck_whole[26..52].shuffle)

player1 = Player.new("Robert", deck1)
player2 = Player.new("Jade", deck2)



game = Game.new(1, player1, player2)
game.start
game.run
binding.pry
