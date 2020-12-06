require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/play_game'

card1 = Card.new(:spades, 'Ace', 14)
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
card14 = Card.new(:hearts, 'Ace', 14)
card15 = Card.new(:hearts, '2', 2)
card16 = Card.new(:hearts, '3', 3)
card17 = Card.new(:hearts, '4', 4)
card18 = Card.new(:hearts, '5', 5)
card19 = Card.new(:hearts, '6', 6)
card20 = Card.new(:hearts, '7', 7)
card21 = Card.new(:hearts, '8', 8)
card22 = Card.new(:hearts, '9', 9)
card23 = Card.new(:hearts, '10', 10)
card24 = Card.new(:hearts, 'Jack', 11)
card25 = Card.new(:hearts, 'Queen', 12)
card26 = Card.new(:hearts, 'King', 13)
card27 = Card.new(:diamonds, 'Ace', 14)
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
card40 = Card.new(:clubs, 'Ace', 14)
card41 = Card.new(:clubs, '2', 2)
card42 = Card.new(:clubs, '3', 3)
card43 = Card.new(:clubs, '4', 4)
card44 = Card.new(:clubs, '5', 5)
card45 = Card.new(:clubs, '6', 6)
card46 = Card.new(:clubs, '7', 7)
card47 = Card.new(:clubs, '8', 8)
card48 = Card.new(:clubs, '9', 9)
card49 = Card.new(:clubs, '10', 10)
card50 = Card.new(:clubs, 'Jack', 11)
card51 = Card.new(:clubs, 'Queen', 12)
card52 = Card.new(:clubs, 'King', 13)
# suits = %w[hearts diamonds spades clubs]
# values = ('2'..'10').to_a + %w('Jack' 'Queen' 'King' 'Ace')
# ranks = (2..14).to_a


cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10,
        card11, card12, card13, card14, card15, card16, card17, card18, card19,
        card20, card21, card22, card23, card24, card25, card26, card27, card28,
        card29, card30, card31, card32, card33, card34, card35, card36, card37,
        card38, card39, card40, card41, card42, card43, card44, card45, card46,
        card47, card48, card49, card50, card51, card52]


deck1 = Deck.new([card1, card14, card16, card23, card38, card51,
                  card4, card11, card17, card33, card40, card43,
                  card18,card25, card28, card30, card45, card46,
                  card8, card21, card26, card34, card36, card50,
                  card41, card47])
deck2 = Deck.new([card2, card3, card13, card52, card9, card10,
                  card20, card32, card42, card44, card48, card7,
                  card6, card12, card24, card29, card31, card49,
                  card5, card15, card22, card35, card37, card39,
                  card19, card27])

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)
game1 = PlayGame.new(turn)

# winner = turn.winner

# require "pry"; binding.pry

game1.start
