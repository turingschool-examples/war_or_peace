# This is my runner file for War or Peace
class War
  attr_reader :deck1, :deck2

  def initialize (standard_deck_of_cards, player1, player2)
    @standard_deck_of_cards = standard_deck_of_cards
    @player1 = player1
    @player2 = player2
  end

# Create 52 Cards (A standard deck)
@card1 = Card.new(:spade, 'Ace', 14)
@card2 = Card.new(:spade, '2', 2)
@card3 = Card.new(:spade, '3', 3)
@card4 = Card.new(:spade, '4', 4)
@card5 = Card.new(:spade, '5', 5)
@card6 = Card.new(:spade, '6', 6)
@card7 = Card.new(:spade, '7', 7)
@card8 = Card.new(:spade, '8', 8)
@card9 = Card.new(:spade, '9', 9)
@card10 = Card.new(:spade, '10', 10)
@card11 = Card.new(:spade, 'Jack', 11)
@card12 = Card.new(:spade, 'Queen', 12)
@card13 = Card.new(:spade, 'King', 13)

@card14 = Card.new(:heart, 'Ace', 14)
@card15 = Card.new(:heart, '2', 2)
@card16 = Card.new(:heart, '3', 3)
@card17 = Card.new(:heart, '4', 4)
@card18 = Card.new(:heart, '5', 5)
@card19 = Card.new(:heart, '6', 6)
@card20 = Card.new(:heart, '7', 7)
@card21 = Card.new(:heart, '8', 8)
@card22 = Card.new(:heart, '9', 9)
@card23 = Card.new(:heart, '10', 10)
@card24 = Card.new(:heart, 'Jack', 11)
@card25 = Card.new(:heart, 'Queen', 12)
@card26 = Card.new(:heart, 'King', 13)

@card27 = Card.new(:diamond, 'Ace', 14)
@card28 = Card.new(:diamond, '2', 2)
@card29 = Card.new(:diamond, '3', 3)
@card30 = Card.new(:diamond, '4', 4)
@card31 = Card.new(:diamond, '5', 5)
@card32 = Card.new(:diamond, '6', 6)
@card33 = Card.new(:diamond, '7', 7)
@card34 = Card.new(:diamond, '8', 8)
@card35 = Card.new(:diamond, '9', 9)
@card36 = Card.new(:diamond, '10', 10)
@card37 = Card.new(:diamond, 'Jack', 11)
@card38 = Card.new(:diamond, 'Queen', 12)
@card39 = Card.new(:diamond, 'King', 13)

@card40 = Card.new(:clubs, 'Ace', 14)
@card41 = Card.new(:clubs, '2', 1)
@card42 = Card.new(:clubs, '3', 2)
@card43 = Card.new(:clubs, '4', 3)
@card44 = Card.new(:clubs, '5', 4)
@card45 = Card.new(:clubs, '6', 5)
@card46 = Card.new(:clubs, '7', 6)
@card47 = Card.new(:clubs, '8', 7)
@card48 = Card.new(:clubs, '9', 8)
@card49 = Card.new(:clubs, '10', 9)
@card50 = Card.new(:clubs, 'Jack', 10)
@card51 = Card.new(:clubs, 'Queen', 11)
@card52 = Card.new(:clubs, 'King', 12)

# 52 cards
@standard_deck_of_cards = [@card1, @card2, @card3, @card4, @card5, @card6, @card7,
  @card8, @card9, @card10, @card11, @card12, @card13, @card14, @card15, @card16,
  @card17, @card18, @card19, @card20, @card21, @card22, @card23, @card24,
  @card25, @card26, @card27, @card28, @card29, @card30, @card31, @card32,
  @card33, @card34, @card35, @card36, @card37, @card38, @card39, @card40,
  @card41, @card42, @card43, @card44, @card45, @card46, @card47, @card48,
  @card49, @card50, @card51, @card52]

@player1 = player1
@player2 = player2

def random
  @deck1 = []
  @deck2 = []

  @standard_deck_of_cards.shuffle!

  @standard_deck_of_cards.each do |card|
      @deck1 << 26.times.card
      @deck2 << 26.times.card
  end
end
end
# Put those cards into two Decks (some randomness would be nice here!)
# Create two players with the Decks you created
# Start the game using a new method called start
# This method will need to be included in a class - it is up to you which class to include it in - either existing or ✨new ✨
