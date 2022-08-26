require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

# Create deck of 52 cards

full_deck = []

full_deck << card1 = Card.new(:club, '2', 2)
full_deck << card2 = Card.new(:club, '3', 3)
full_deck << card3 = Card.new(:club, '4', 4)
full_deck << card4 = Card.new(:club, '5', 5)
full_deck << card5 = Card.new(:club, '6', 6)
full_deck << card6 = Card.new(:club, '7', 7)
full_deck << card7 = Card.new(:club, '8', 8)
full_deck << card8 = Card.new(:club, '9', 9)
full_deck << card9 = Card.new(:club, '10', 10)
full_deck << card10 = Card.new(:club, 'Jack', 11)
full_deck << card11 = Card.new(:club, 'Queen', 12)
full_deck << card12 = Card.new(:club, 'King', 13)
full_deck << card13 = Card.new(:club, 'Ace', 14)
full_deck << card14 = Card.new(:heart, '2', 2)
full_deck << card15 = Card.new(:heart, '3', 3)
full_deck << card16 = Card.new(:heart, '4', 4)
full_deck << card17 = Card.new(:heart, '5', 5)
full_deck << card18 = Card.new(:heart, '6', 6)
full_deck << card19 = Card.new(:heart, '7', 7)
full_deck << card20 = Card.new(:heart, '8', 8)
full_deck << card21 = Card.new(:heart, '9', 9)
full_deck << card22 = Card.new(:heart, '10', 10)
full_deck << card23 = Card.new(:heart, 'Jack', 11)
full_deck << card24 = Card.new(:heart, 'Queen', 12)
full_deck << card25 = Card.new(:heart, 'King', 13)
full_deck << card26 = Card.new(:heart, 'Ace', 14)
full_deck << card27 = Card.new(:spade, '2', 2)
full_deck << card28 = Card.new(:spade, '3', 3)
full_deck << card29 = Card.new(:spade, '4', 4)
full_deck << card30 = Card.new(:spade, '5', 5)
full_deck << card31 = Card.new(:spade, '6', 6)
full_deck << card32 = Card.new(:spade, '7', 7)
full_deck << card33 = Card.new(:spade, '8', 8)
full_deck << card34 = Card.new(:spade, '9', 9)
full_deck << card35 = Card.new(:spade, '10', 10)
full_deck << card36 = Card.new(:spade, 'Jack', 11)
full_deck << card37 = Card.new(:spade, 'Queen', 12)
full_deck << card38 = Card.new(:spade, 'King', 13)
full_deck << card39 = Card.new(:spade, 'Ace', 14)
full_deck << card40 = Card.new(:diamond, '2', 2)
full_deck << card41 = Card.new(:diamond, '3', 3)
full_deck << card42 = Card.new(:diamond, '4', 4)
full_deck << card43 = Card.new(:diamond, '5', 5)
full_deck << card44 = Card.new(:diamond, '6', 6)
full_deck << card45 = Card.new(:diamond, '7', 7)
full_deck << card46 = Card.new(:diamond, '8', 8)
full_deck << card47 = Card.new(:diamond, '9', 9)
full_deck << card48 = Card.new(:diamond, '10', 10)
full_deck << card49 = Card.new(:diamond, 'Jack', 11)
full_deck << card50 = Card.new(:diamond, 'Queen', 12)
full_deck << card51 = Card.new(:diamond, 'King', 13)
full_deck << card52 = Card.new(:diamond, 'Ace', 14)

# p full_deck[0]
# p full_deck[1]
# p full_deck[2]

full_deck.shuffle!

# p full_deck[0]
# p full_deck[1]
# p full_deck[2]

deck1 = Deck.new
deck2 = Deck.new

26.times do
  deck1.cards << full_deck.shift
end

26.times do
  deck2.cards << full_deck.shift
end

# p full_deck

player1 = Player.new('John', deck1)
player2 = Player.new('Ringo', deck2)

# p player1

