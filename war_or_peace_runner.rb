# Create 52 cards CHECK,
# Put cards in 2 decks (with randomness) CHECK
# Create two players with the decks CHECK
# Start game using a new method called start

require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

diamond_card2 = Card.new(:diamond, '2', 2)
diamond_card3 = Card.new(:diamond, '3', 3)
diamond_card4 = Card.new(:diamond, '4', 4)
diamond_card5 = Card.new(:diamond, '5', 5)
diamond_card6 = Card.new(:diamond, '6', 6)
diamond_card7 = Card.new(:diamond, '7', 7)
diamond_card8 = Card.new(:diamond, '8', 8)
diamond_card9 = Card.new(:diamond, '9', 9)
diamond_card10 = Card.new(:diamond, '10', 10)
diamond_cardJ = Card.new(:diamond, 'Jack', 11)
diamond_cardQ = Card.new(:diamond, 'Queen', 12)
diamond_cardK = Card.new(:diamond, 'King', 13)
diamond_cardA = Card.new(:diamond, 'Ace', 14)

club_card2 = Card.new(:club, '2', 2)
club_card3 = Card.new(:club, '3', 3)
club_card4 = Card.new(:club, '4', 4)
club_card5 = Card.new(:club, '5', 5)
club_card6 = Card.new(:club, '6', 6)
club_card7 = Card.new(:club, '7', 7)
club_card8 = Card.new(:club, '8', 8)
club_card9 = Card.new(:club, '9', 9)
club_card10 = Card.new(:club, '10', 10)
club_cardJ = Card.new(:club, 'Jack', 11)
club_cardQ = Card.new(:club, 'Queen', 12)
club_cardK = Card.new(:club, 'King', 13)
club_cardA = Card.new(:club, 'Ace', 14)

spade_card2 = Card.new(:spade, '2', 2)
spade_card3 = Card.new(:spade, '3', 3)
spade_card4 = Card.new(:spade, '4', 4)
spade_card5 = Card.new(:spade, '5', 5)
spade_card6 = Card.new(:spade, '6', 6)
spade_card7 = Card.new(:spade, '7', 7)
spade_card8 = Card.new(:spade, '8', 8)
spade_card9 = Card.new(:spade, '9', 9)
spade_card10 = Card.new(:spade, '10', 10)
spade_cardJ = Card.new(:spade, 'Jack', 11)
spade_cardQ = Card.new(:spade, 'Queen', 12)
spade_cardK = Card.new(:spade, 'King', 13)
spade_cardA = Card.new(:spade, 'Ace', 14)

heart_card2 = Card.new(:heart, '2', 2)
heart_card3 = Card.new(:heart, '3', 3)
heart_card4 = Card.new(:heart, '4', 4)
heart_card5 = Card.new(:heart, '5', 5)
heart_card6 = Card.new(:heart, '6', 6)
heart_card7 = Card.new(:heart, '7', 7)
heart_card8 = Card.new(:heart, '8', 8)
heart_card9 = Card.new(:heart, '9', 9)
heart_card10 = Card.new(:heart, '10', 10)
heart_cardJ = Card.new(:heart, 'Jack', 11)
heart_cardQ = Card.new(:heart, 'Queen', 12)
heart_cardK = Card.new(:heart, 'King', 13)
heart_cardA = Card.new(:heart, 'Ace', 14)

deck1_cards = [
  diamond_card2,
  diamond_card4,
  diamond_card5,
  diamond_card7,
  diamond_card10,
  diamond_cardQ,
  club_card2,
  club_card3,
  club_card5,
  club_card7,
  club_card9,
  club_card10,
  club_cardA,
  spade_card2,
  spade_card5,
  spade_card8,
  spade_card9,
  spade_cardJ,
  spade_cardQ,
  spade_cardK,
  heart_card3,
  heart_card4,
  heart_card6,
  heart_card7,
  heart_card10,
  heart_cardQ,
  heart_cardK
]

deck2_cards = [
  diamond_card3,
  diamond_card6,
  diamond_card8,
  diamond_card9,
  diamond_cardJ,
  diamond_cardK,
  diamond_cardA,
  club_card4,
  club_card6,
  club_card8,
  club_cardJ,
  club_cardQ,
  club_cardK,
  spade_card3,
  spade_card4,
  spade_card6,
  spade_card7,
  spade_card10,
  spade_cardQ,
  spade_cardA,
  heart_card2,
  heart_card5,
  heart_card8,
  heart_card9,
  heart_cardJ,
  heart_cardA
]

deck1 = Deck.new(deck1_cards)
deck2 = Deck.new(deck2_cards)

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

game = Game.new(player1, player2)

game.start
