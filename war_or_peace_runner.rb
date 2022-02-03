require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require 'pry'

heart_card2 = Card.new(:heart, '2', 2)
heart_card3 = Card.new(:heart, '3', 3)
heart_card4 = Card.new(:heart, '4', 4)
heart_card5 = Card.new(:heart, '5', 5)
heart_card6 = Card.new(:heart, '6', 6)
heart_card7 = Card.new(:heart, '7', 7)
heart_card8 = Card.new(:heart, '8', 8)
heart_card9 = Card.new(:heart, '9', 9)
heart_card10 = Card.new(:heart, '10', 10)
heart_card11 = Card.new(:heart, 'Jack', 11)
heart_card12 = Card.new(:heart, 'Queen', 12)
heart_card13 = Card.new(:heart, 'King', 13)
heart_card14 = Card.new(:heart, 'Ace', 14)

diamond_card2 = Card.new(:diamond, '2', 2)
diamond_card3 = Card.new(:diamond, '3', 3)
diamond_card4 = Card.new(:diamond, '4', 4)
diamond_card5 = Card.new(:diamond, '5', 5)
diamond_card6 = Card.new(:diamond, '6', 6)
diamond_card7 = Card.new(:diamond, '7', 7)
diamond_card8 = Card.new(:diamond, '8', 8)
diamond_card9 = Card.new(:diamond, '9', 9)
diamond_card10 = Card.new(:diamond, '10', 10)
diamond_card11 = Card.new(:diamond, 'Jack', 11)
diamond_card12 = Card.new(:diamond, 'Queen', 12)
diamond_card13 = Card.new(:diamond, 'King', 13)
diamond_card14 = Card.new(:diamond, 'Ace', 14)

club_card2 = Card.new(:club, '2', 2)
club_card3 = Card.new(:club, '3', 3)
club_card4 = Card.new(:club, '4', 4)
club_card5 = Card.new(:club, '5', 5)
club_card6 = Card.new(:club, '6', 6)
club_card7 = Card.new(:club, '7', 7)
club_card8 = Card.new(:club, '8', 8)
club_card9 = Card.new(:club, '9', 9)
club_card10 = Card.new(:club, '10', 10)
club_card11 = Card.new(:club, 'Jack', 11)
club_card12 = Card.new(:club, 'Queen', 12)
club_card13 = Card.new(:club, 'King', 13)
club_card14 = Card.new(:club, 'Ace', 14)

spade_card2 = Card.new(:spade, '2', 2)
spade_card3 = Card.new(:spade, '3', 3)
spade_card4 = Card.new(:spade, '4', 4)
spade_card5 = Card.new(:spade, '5', 5)
spade_card6 = Card.new(:spade, '6', 6)
spade_card7 = Card.new(:spade, '7', 7)
spade_card8 = Card.new(:spade, '8', 8)
spade_card9 = Card.new(:spade, '9', 9)
spade_card10 = Card.new(:spade, '10', 10)
spade_card11 = Card.new(:spade, 'Jack', 11)
spade_card12 = Card.new(:spade, 'Queen', 12)
spade_card13 = Card.new(:spade, 'King', 13)
spade_card14 = Card.new(:spade, 'Ace', 14)

unshuffled_deck = [
        heart_card2,
        heart_card3,
        heart_card4,
        heart_card5,
        heart_card6,
        heart_card7,
        heart_card8,
        heart_card9,
        heart_card10,
        heart_card11,
        heart_card12,
        heart_card13,
        heart_card14,
        diamond_card2,
        diamond_card3,
        diamond_card4,
        diamond_card5,
        diamond_card6,
        diamond_card7,
        diamond_card8,
        diamond_card9,
        diamond_card10,
        diamond_card11,
        diamond_card12,
        diamond_card13,
        diamond_card14,
        club_card2,
        club_card3,
        club_card4,
        club_card5,
        club_card6,
        club_card7,
        club_card8,
        club_card9,
        club_card10,
        club_card11,
        club_card12,
        club_card13,
        club_card14,
        spade_card2,
        spade_card3,
        spade_card4,
        spade_card5,
        spade_card6,
        spade_card7,
        spade_card8,
        spade_card9,
        spade_card10,
        spade_card11,
        spade_card12,
        spade_card13,
        spade_card14
      ]

shuffled_deck = unshuffled_deck.shuffle

player1_deck = []
player2_deck = []

26.times do
  player1_deck << shuffled_deck.shift
  player2_deck << shuffled_deck.shift
end

player1 = Player.new('Robot 1', player1_deck)
player2 = Player.new('Robot 2', player2_deck)
