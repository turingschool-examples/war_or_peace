require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

card1 = Card.new(:diamond, 'Ace', 14)
card2 = Card.new(:diamond, 'King', 13)
card3 = Card.new(:diamond, 'Queen', 12)
card4 = Card.new(:diamond, 'Jack', 11)
card5 = Card.new(:diamond, '10', 10)
card6 = Card.new(:diamond, '9', 9)
card7 = Card.new(:diamond, '8', 8)
card8 = Card.new(:diamond, '7', 7)
card9 = Card.new(:diamond, '6', 6)
card10 = Card.new(:diamond, '5', 5)
card11 = Card.new(:diamond, '4', 4)
card12 = Card.new(:diamond, '3', 3)
card13 = Card.new(:diamond, '2', 2)
card14 = Card.new(:diamond, '1', 1)

deck1 = Deck.new([card11, card5, card14, card7, card6, card1, card10])

deck2 = Deck.new([card12, card3, card4, card8, card9, card2, card13])

player1 = Player.new('Stephanie', deck1)
player2 = Player.new('Sunita', deck2)

game1 = Game.new(player1, player2)
