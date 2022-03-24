require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'


card1 = Card.new(:heart, 'Ace', 14)
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

card14 = Card.new(:spade, 'Ace', 14)
card15 = Card.new(:spade, '2', 2)
card16 = Card.new(:spade, '3', 3)
card17 = Card.new(:spade, '4', 4)
card18 = Card.new(:spade, '5', 5)
card19 = Card.new(:spade, '6', 6)
card20 = Card.new(:spade, '7', 7)
card21 = Card.new(:spade, '8', 8)
card22 = Card.new(:spade, '9', 9)
card23 = Card.new(:spade, '10', 10)
card24 = Card.new(:spade, 'Jack', 11)
card25 = Card.new(:spade, 'Queen', 12)
card26 = Card.new(:spade, 'King', 13)

card27 = Card.new(:club, 'Ace', 14)
card28 = Card.new(:club, '2', 2)
card29 = Card.new(:club, '3', 3)
card30 = Card.new(:club, '4', 4)
card31 = Card.new(:club, '5', 5)
card32 = Card.new(:club, '6', 6)
card33 = Card.new(:club, '7', 7)
card34 = Card.new(:club, '8', 8)
card35 = Card.new(:club, '9', 9)
card36 = Card.new(:club, '10', 10)
card37 = Card.new(:club, 'Jack', 11)
card38 = Card.new(:club, 'Queen', 12)
card39 = Card.new(:club, 'King', 13)

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'Go' to start the game!"

starter_input = gets.chomp
p starter_input
