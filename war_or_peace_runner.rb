# Create 52 cards (standard deck)
# Put cards into 2 decks(random)
# Create 2 players with the decks
# Start game with a start method
# start method can be in a new class or existing class

require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

class NewGame

  def create_deck

    deck_of_cards = []

    deck_of_cards << card1 = Card.new(:spade, '2', 2)
    deck_of_cards << card2 = Card.new(:spade, '3', 3)
    deck_of_cards << card3 = Card.new(:spade, '4', 4)
    deck_of_cards << card4 = Card.new(:spade, '5', 5)
    deck_of_cards << card5 = Card.new(:spade, '6', 6)
    deck_of_cards << card6 = Card.new(:spade, '7', 7)
    deck_of_cards << card7 = Card.new(:spade, '8', 8)
    deck_of_cards << card8 = Card.new(:spade, '9', 9)
    deck_of_cards << card9 = Card.new(:spade, '10', 10)
    deck_of_cards << card10 = Card.new(:spade, 'Jack', 11)
    deck_of_cards << card11 = Card.new(:spade, 'Queen', 12)
    deck_of_cards << card12 = Card.new(:spade, 'King', 13)
    deck_of_cards << card13 = Card.new(:spade, 'Ace', 14)

    deck_of_cards << card14 = Card.new(:heart, '2', 2)
    deck_of_cards << card15 = Card.new(:heart, '3', 3)
    deck_of_cards << card16 = Card.new(:heart, '4', 4)
    deck_of_cards << card17 = Card.new(:heart, '5', 5)
    deck_of_cards << card18 = Card.new(:heart, '6', 6)
    deck_of_cards << card19 = Card.new(:heart, '7', 7)
    deck_of_cards << card20 = Card.new(:heart, '8', 8)
    deck_of_cards << card21 = Card.new(:heart, '9', 9)
    deck_of_cards << card22 = Card.new(:heart, '10', 10)
    deck_of_cards << card23 = Card.new(:heart, 'Jack', 11)
    deck_of_cards << card24 = Card.new(:heart, 'Queen', 12)
    deck_of_cards << card25 = Card.new(:heart, 'King', 13)
    deck_of_cards << card26 = Card.new(:heart, 'Ace', 14)

    deck_of_cards << card27 = Card.new(:diamond, '2', 2)
    deck_of_cards << card28 = Card.new(:diamond, '3', 3)
    deck_of_cards << card29 = Card.new(:diamond, '4', 4)
    deck_of_cards << card30 = Card.new(:diamond, '5', 5)
    deck_of_cards << card31 = Card.new(:diamond, '6', 6)
    deck_of_cards << card32 = Card.new(:diamond, '7', 7)
    deck_of_cards << card33 = Card.new(:diamond, '8', 8)
    deck_of_cards << card34 = Card.new(:diamond, '9', 9)
    deck_of_cards << card35 = Card.new(:diamond, '10', 10)
    deck_of_cards << card36 = Card.new(:diamond, 'Jack', 11)
    deck_of_cards << card37 = Card.new(:diamond, 'Queen', 12)
    deck_of_cards << card38 = Card.new(:diamond, 'King', 13)
    deck_of_cards << card39 = Card.new(:diamond, 'Ace', 14)

    deck_of_cards << card40 = Card.new(:club, '2', 2)
    deck_of_cards << card41 = Card.new(:club, '3', 3)
    deck_of_cards << card42 = Card.new(:club, '4', 4)
    deck_of_cards << card43 = Card.new(:club, '5', 5)
    deck_of_cards << card44 = Card.new(:club, '6', 6)
    deck_of_cards << card45 = Card.new(:club, '7', 7)
    deck_of_cards << card46 = Card.new(:club, '8', 8)
    deck_of_cards << card47 = Card.new(:club, '9', 9)
    deck_of_cards << card48 = Card.new(:club, '10', 10)
    deck_of_cards << card49 = Card.new(:club, 'Jack', 11)
    deck_of_cards << card50 = Card.new(:club, 'Queen', 12)
    deck_of_cards << card51 = Card.new(:club, 'King', 13)
    deck_of_cards << card52 = Card.new(:club, 'Ace', 14)
  end
end
