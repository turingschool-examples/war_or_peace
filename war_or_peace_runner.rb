require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'
require 'rspec'


unshuffled_cards =
[card = Card.new(:clubs, '2', 2),
card1 = Card.new(:club, '3', 3),
card2 = Card.new(:club, '4', 4),
card3 = Card.new(:clubs, '5', 5),
card4 = Card.new(:club, '6', 6),
card5 = Card.new(:club, '7', 7),
card6 = Card.new(:clubs, '8', 8),
card7 = Card.new(:club, '9', 9),
card8 = Card.new(:club, '10', 10),
card9 = Card.new(:clubs, 'Jack', 11),
card10 = Card.new(:club, 'Queen', 12),
card11 = Card.new(:diamond, 'King', 13),
card12 = Card.new(:club, 'Ace', 14),
card13 = Card.new(:diamond, '2', 2),
card14 = Card.new(:diamond, '3', 3),
card15 = Card.new(:diamond, '4', 4),
card16 = Card.new(:diamond, '5', 5),
card17 = Card.new(:diamond, '6', 6),
card18 = Card.new(:diamond, '7', 7),
card19 = Card.new(:diamond, '8', 8),
card20 = Card.new(:diamond, '9', 9),
card21 = Card.new(:diamond, '10', 10),
card22 = Card.new(:diamond, 'Jack', 11),
card23 = Card.new(:diamond, 'Queen', 12),
card24 = Card.new(:diamond, 'King', 13),
card25 = Card.new(:diamond, 'Ace', 14),
card26 = Card.new(:heart, '2', 2),
card27 = Card.new(:heart, '3', 3),
card28 = Card.new(:heart, '4', 4),
card29 = Card.new(:heart, '5', 5),
card30 = Card.new(:heart, '6', 6),
card31 = Card.new(:heart, '7', 7),
card32 = Card.new(:heart, '8', 8),
card33 = Card.new(:heart, '9', 9),
card34 = Card.new(:heart, '10', 10),
card35 = Card.new(:heart, 'Jack', 11),
card36 = Card.new(:heart, 'Queen', 12),
card37 = Card.new(:diamond, 'King', 13),
card38 = Card.new(:heart, 'Ace', 14),
card39 = Card.new(:spades, '2', 2),
card40 = Card.new(:spades, '3', 3),
card41 = Card.new(:spades, '4', 4),
card42 = Card.new(:spades, '5', 5),
card43 = Card.new(:spades, '6', 6),
card44 = Card.new(:spades, '7', 7),
card45 = Card.new(:spades, '8', 8),
card46 = Card.new(:spades, '9', 9),
card47 = Card.new(:spades, '10', 10),
card48 = Card.new(:spades, 'Jack', 11),
card49 = Card.new(:spades, 'Queen', 12),
card50 = Card.new(:diamond, 'King', 13),
card51 = Card.new(:spades, 'Ace', 14)]

shuffled_cards = unshuffled_cards.shuffle

cards1 = shuffled_cards[0..25]
cards2 = shuffled_cards[26..51]
binding.pry
deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)
player1 = Player.new("Schmendrick", deck1)
player2 = Player.new("Lady Amalthea", deck2)

p "Welcome to War! (or Peace)"
p "This game will be played with 52 cards."
p "The players today are Schmendrick and Lady Amalthea."
p "Type 'GO' to start the game!"

user_input = gets.chomp.upcase
if user_input == "GO"
  game = Game.new(player1, player2)
  game.start
else
  p "Only 'GO' can start the game!"
end
