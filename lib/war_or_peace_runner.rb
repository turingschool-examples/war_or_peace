require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
#need to test that you need these requires ^^


#create 52 cards, put into two decks randomly. create two players
#start the game with a .start method
card1 = Card.new(:heart, 'Jack', 11)
card2 = Card.new(:heart, '10', 10)
card3 = Card.new(:heart, '9', 9)
card4 = Card.new(:diamond, 'Jack', 11)
card5 = Card.new(:heart, '8', 8)
card6 = Card.new(:diamond, 'Queen', 12)
card7 = Card.new(:heart, '3', 3)
card8 = Card.new(:diamond, '2', 2)
