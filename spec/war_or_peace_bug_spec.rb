require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

    card1 = Card.new(:heart, '2', 2)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:heart, '4', 4)
    card4 = Card.new(:heart, '5', 5)
    card5 = Card.new(:heart, '6', 6)
    card6 = Card.new(:heart, '7', 7)
    card7 = Card.new(:heart, '8', 8)

cards = [card1, card2, card3, card4, card5, card6, card7]
game = Game.new(cards)
game.run_game