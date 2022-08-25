require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"


# Create the standard 52 cards
all_cards = []
    # hearts
all_cards << card1 = Card.new(:heart, "2", 2)
all_cards << card2 = Card.new(:heart, "3", 3)
all_cards << card3 = Card.new(:heart, "4", 4)
all_cards << card4 = Card.new(:heart, "5", 5)
all_cards << card5 = Card.new(:heart, "6", 6)
all_cards << card6 = Card.new(:heart, "7", 7)
all_cards << card7 = Card.new(:heart, "8", 8)
all_cards << card8 = Card.new(:heart, "9", 9)
all_cards << card9 = Card.new(:heart, "10", 10)
all_cards << card10 = Card.new(:heart, "Jack", 11)
all_cards << card11 = Card.new(:heart, "Queen", 12)
all_cards << card12 = Card.new(:heart, "King", 13)
all_cards << card13 = Card.new(:heart, "Ace", 14)
    # clubs
all_cards << card14 = Card.new(:club, "2", 2)
all_cards << card15 = Card.new(:club, "3", 3)
all_cards << card16 = Card.new(:club, "4", 4)
all_cards << card17 = Card.new(:club, "5", 5)
all_cards << card18 = Card.new(:club, "6", 6)
all_cards << card19 = Card.new(:club, "7", 7)
all_cards << card20 = Card.new(:club, "8", 8)
all_cards << card21 = Card.new(:club, "9", 9)
all_cards << card22 = Card.new(:club, "10", 10)
all_cards << card23 = Card.new(:club, "Jack", 11)
all_cards << card24 = Card.new(:club, "Queen", 12)
all_cards << card25 = Card.new(:club, "King", 13)
all_cards << card26 = Card.new(:club, "Ace", 14)
    # diamonds
all_cards << card27 = Card.new(:diamond, "2", 2)
all_cards << card28 = Card.new(:diamond, "3", 3)
all_cards << card29 = Card.new(:diamond, "4", 4)
all_cards << card30 = Card.new(:diamond, "5", 5)
all_cards << card31 = Card.new(:diamond, "6", 6)
all_cards << card32 = Card.new(:diamond, "7", 7)
all_cards << card33 = Card.new(:diamond, "8", 8)
all_cards << card34 = Card.new(:diamond, "9", 9)
all_cards << card35 = Card.new(:diamond, "10", 10)
all_cards << card36 = Card.new(:diamond, "Jack", 11)
all_cards << card37 = Card.new(:diamond, "Queen", 12)
all_cards << card38 = Card.new(:diamond, "King", 13)
all_cards << card39 = Card.new(:diamond, "Ace", 14)
    # spades
all_cards << card40 = Card.new(:spade, "2", 2)
all_cards << card41 = Card.new(:spade, "3", 3)
all_cards << card42 = Card.new(:spade, "4", 4)
all_cards << card43 = Card.new(:spade, "5", 5)
all_cards << card44 = Card.new(:spade, "6", 6)
all_cards << card45 = Card.new(:spade, "7", 7)
all_cards << card46 = Card.new(:spade, "8", 8)
all_cards << card47 = Card.new(:spade, "9", 9)
all_cards << card48 = Card.new(:spade, "10", 10)
all_cards << card49 = Card.new(:spade, "Jack", 11)
all_cards << card50 = Card.new(:spade, "Queen", 12)
all_cards << card51 = Card.new(:spade, "King", 13)
all_cards << card52 = Card.new(:spade, "Ace", 14)

# shuffle 3 times
shuffled_once = all_cards.shuffle
shuffled_twice = shuffled_once.shuffle
shuffled_thrice = shuffled_twice.shuffle

# split cards into two Decks
cards1 = shuffled_thrice[0..25]
cards2 = shuffled_thrice[26..51]
deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)

# create two players 
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)