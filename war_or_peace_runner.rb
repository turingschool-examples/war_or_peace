require 'pry'
require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'
require './lib/card_generator'


# automatic deck creation begin...run only one deck creation at a time, please.
# suits = [:spade, :club, :heart, :diamond]
# values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
# ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
# deck_of_cards = []
# suits.each do |suit|
#   starting_index = 0
#   values.each do |value|
#     deck_of_cards << Card.new(suit, value, ranks[starting_index])
#     starting_index += 1
#   end
# end
# shuffled_deck = deck_of_cards.shuffle
# shuffled_deck1 = []
# shuffled_deck2 = []
# 26.times do
#   shuffled_deck1 << shuffled_deck.shift
#   shuffled_deck2 << shuffled_deck.shift
# end
# deck1 = Deck.new(shuffled_deck1)
# deck2 = Deck.new(shuffled_deck2)
# automatic deck creation end

# manual deck creation begin...run only one deck creation at a time, please.
# full_deck = [
#   card1 = Card.new(:spade, '2', 2),
#   card2 = Card.new(:spade, '3', 3),
#   card3 = Card.new(:spade, '4', 4),
#   card4 = Card.new(:spade, '5', 5),
#   card5 = Card.new(:spade, '6', 6),
#   card6 = Card.new(:spade, '7', 7),
#   card7 = Card.new(:spade, '8', 8),
#   card8 = Card.new(:spade, '9', 9),
#   card9 = Card.new(:spade, '10', 10),
#   card10 = Card.new(:spade, 'Jack', 11),
#   card11 = Card.new(:spade, 'Queen', 12),
#   card12 = Card.new(:spade, 'King', 13),
#   card13 = Card.new(:spade, 'Ace', 14),
#   card14 = Card.new(:club, '2', 2),
#   card15 = Card.new(:club, '3', 3),
#   card16 = Card.new(:club, '4', 4),
#   card17 = Card.new(:club, '5', 5),
#   card18 = Card.new(:club, '6', 6),
#   card19 = Card.new(:club, '7', 7),
#   card20 = Card.new(:club, '8', 8),
#   card21 = Card.new(:club, '9', 9),
#   card22 = Card.new(:club, '10', 10),
#   card23 = Card.new(:club, 'Jack', 11),
#   card24 = Card.new(:club, 'Queen', 12),
#   card25 = Card.new(:club, 'King', 13),
#   card26 = Card.new(:club, 'Ace', 14),
#   card27 = Card.new(:heart, '2', 2),
#   card28 = Card.new(:heart, '3', 3),
#   card29 = Card.new(:heart, '4', 4),
#   card30 = Card.new(:heart, '5', 5),
#   card31 = Card.new(:heart, '6', 6),
#   card32 = Card.new(:heart, '7', 7),
#   card33 = Card.new(:heart, '8', 8),
#   card34 = Card.new(:heart, '9', 9),
#   card35 = Card.new(:heart, '10', 10),
#   card36 = Card.new(:heart, 'Jack', 11),
#   card37 = Card.new(:heart, 'Queen', 12), card38 = Card.new(:heart, 'King', 13),
#   card39 = Card.new(:heart, 'Ace', 14),
#   card40 = Card.new(:diamond, '2', 2),
#   card41 = Card.new(:diamond, '3', 3),
#   card42 = Card.new(:diamond, '4', 4),
#   card43 = Card.new(:diamond, '5', 5),
#   card44 = Card.new(:diamond, '6', 6),
#   card45 = Card.new(:diamond, '7', 7),
#   card46 = Card.new(:diamond, '8', 8),
#   card47 = Card.new(:diamond, '9', 9),
#   card48 = Card.new(:diamond, '10', 10),
#   card49 = Card.new(:diamond, 'Jack', 11),
#   card50 = Card.new(:diamond, 'Queen', 12),
#   card51 = Card.new(:diamond, 'King', 13),
#   card52 = Card.new(:diamond, 'Ace', 14)
# ]
# shuffled_deck = full_deck.shuffle
# shuffled_deck1 = []
# shuffled_deck2 = []
# 26.times do
#   shuffled_deck1 << shuffled_deck.shift
#   shuffled_deck2 << shuffled_deck.shift
# end
# deck1 = Deck.new(shuffled_deck1)
# deck2 = Deck.new(shuffled_deck2)
# manual deck creation end

# test deck creation begin...for testing purposes only
# deck1 = Deck.new([
#  card1 = Card.new(:spade, '2', 2),
#  card2 = Card.new(:spade, '3', 3),
#  card3 = Card.new(:spade, '4', 4),
#  card4 = Card.new(:spade, '5', 5),
#  card5 = Card.new(:spade, '6', 6),
#  card7 = Card.new(:spade, '8', 8),
#  card6 = Card.new(:spade, '7', 7),
#  card8 = Card.new(:spade, '9', 9),
#  card9 = Card.new(:spade, '10', 10),
#  card10 = Card.new(:spade, 'Jack', 11),
#  card11 = Card.new(:spade, 'Queen', 12),
#  card12 = Card.new(:spade, 'King', 13),
#  card13 = Card.new(:spade, 'Ace', 14)
# ])
# deck2 = Deck.new([
#   card14 = Card.new(:club, '2', 2),
#   card15 = Card.new(:club, '3', 3),
#   card16 = Card.new(:club, '4', 4),
#   card17 = Card.new(:club, '5', 5),
#   card18 = Card.new(:club, '6', 6),
#   card19 = Card.new(:club, '7', 7),
#   card20 = Card.new(:club, '8', 8),
#   card21 = Card.new(:club, '9', 9),
#   card22 = Card.new(:club, '10', 10),
#   card23 = Card.new(:club, 'Jack', 11),
#   card24 = Card.new(:club, 'Queen', 12),
#   card25 = Card.new(:club, 'King', 13),
#   card26 = Card.new(:club, 'Ace', 14)
# ])
# output from these decks should be => :mutually_assured_destruction, => :war, => :basic, and will eventually return message for when someone runs out of cards
# test deck creation end

# iteration 4 deck making begin
filename = "cards.txt"
cards = CardGenerator.new(filename).cards
shuffled_deck = cards.shuffle
shuffled_deck1 = []
shuffled_deck2 = []
26.times do
  shuffled_deck1 << shuffled_deck.shift
  shuffled_deck2 << shuffled_deck.shift
end
deck1 = Deck.new(shuffled_deck1)
deck2 = Deck.new(shuffled_deck2)
# iteration 4 deck making end

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

game = Start.new(player1, player2)

game.start
