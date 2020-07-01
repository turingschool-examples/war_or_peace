require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/turn'

card1 = Card.new(:heart, 'Ace', 1)
card2 = Card.new(:heart, '2', 2)
card3 = Card.new(:heart, '3', 3)
card4 = Card.new(:heart, '4', 4)
card5 = Card.new(:heart, '5', 5)
card6 = Card.new(:heart, '6', 6)
card7 = Card.new(:heart, '7', 7)
card8 = Card.new(:heart, '8', 8)
card9 = Card.new(:heart, '9', 9)
card10 = Card.new(:heart, '10', 10)
card11 = Card.new(:heart, 'Jack', 11)
card12 = Card.new(:heart, 'Queen', 12)
card13 = Card.new(:heart, 'King', 13)

card14 = Card.new(:spades, 'Ace', 1)
card15 = Card.new(:spades, '2', 2)
card16 = Card.new(:spades, '3', 3)
card17 = Card.new(:spades, '4', 4)
card18 = Card.new(:spades, '5', 5)
card19 = Card.new(:spades, '6', 6)
card20 = Card.new(:spades, '7', 7)
card21 = Card.new(:spades, '8', 8)
card22 = Card.new(:spades, '9', 9)
card23 = Card.new(:spades, '10', 10)
card24 = Card.new(:spades, 'Jack', 11)
card25 = Card.new(:spades, 'Queen', 12)
card26 = Card.new(:spades, 'King', 13)

card27 = Card.new(:diamonds, 'Ace', 1)
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

card40 = Card.new(:clubs, 'Ace', 1)
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

hearts = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13]
spades =[card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26]
diamonds = [card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39]
clubs = [card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52]

all_decks = hearts + spades + diamonds + clubs
all_decks_random = all_decks.shuffle
deck1 = Deck.new(all_decks_random.drop(26))
deck2 = Deck.new(all_decks_random.take(26))
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)


puts "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are Megan and Aurora. Type 'GO' to start the game!"
p '------------------------------------------------------------------'



#
# turn = Turn.new(player1, player2)
#
#
# winner = turn.winner
