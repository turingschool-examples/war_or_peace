require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

standard_deck = [
  card1 = Card.new(:diamond, "2", 2),
  card2 = Card.new(:diamond, "3", 3),
  card3 = Card.new(:diamond, "4", 4),
  card4 = Card.new(:diamond, "5", 5),
  card5 = Card.new(:diamond, "6", 6),
  card6 = Card.new(:diamond, "7", 7),
  card7 = Card.new(:diamond, "8", 8),
  card8 = Card.new(:diamond, "9", 9),
  card9 = Card.new(:diamond, "10", 10),
  card10 = Card.new(:diamond, "Jack", 11),
  card11 = Card.new(:diamond, "Queen", 12),
  card12 = Card.new(:diamond, "King", 13),
  card13 = Card.new(:diamond, "Ace", 14),
  card14 = Card.new(:heart, "2", 2),
  card15 = Card.new(:heart, "3", 3),
  card16 = Card.new(:heart, "4", 4),
  card17 = Card.new(:heart, "5", 5),
  card18 = Card.new(:heart, "6", 6),
  card19 = Card.new(:heart, "7", 7),
  card20 = Card.new(:heart, "8", 8),
  card21 = Card.new(:heart, "9", 9),
  card22 = Card.new(:heart, "10", 10),
  card23 = Card.new(:heart, "Jack", 11),
  card24 = Card.new(:heart, "Queen", 12),
  card25 = Card.new(:heart, "King", 13),
  card26 = Card.new(:heart, "Ace", 14)
]


shuffled_standard_deck = standard_deck.shuffle
shuffled1 = []
shuffled2 = []
require "pry"; binding.pry
13.times do   ###CHANGE TO 26 WHEN MOVING TO FULL DECK
  shuffled1 << shuffled_standard_deck.shift
  shuffled2 << shuffled_standard_deck.shift
end
deck1 = Deck.new(shuffled1)
deck2 = Deck.new(shuffled2)

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
