require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
card1 = Card.new(:heart, 'Jack', 11)
card2 = Card.new(:heart, '10', 10)
card3 = Card.new(:heart, '9', 9)
card4 = Card.new(:diamond, 'Jack', 11)
card5 = Card.new(:heart, '8', 8)
card6 = Card.new(:diamond, 'Queen', 12)
card7 = Card.new(:heart, '3', 3)
card8 = Card.new(:diamond, '2', 2)
deck1 = Deck.new([card1, card2, card5, card8])
deck2 = Deck.new([card3, card4, card6, card7])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn1 = Turn.new(player1, player2)
deck3 = Deck.new([card8, card2, card5, card1])
deck4 = Deck.new([card8, card3, card4, card6])
player1 = Player.new("Alejandro", deck3)
player2 = Player.new("Bob", deck4)
turn2 = Turn.new(player1, player2)
deck5 = Deck.new([card8, card2, card1, card1])
deck6 = Deck.new([card8, card3, card4, card6])
player1 = Player.new("Alejandro", deck5)
player2 = Player.new("Bob", deck6)
turn3 = Turn.new(player1, player2)
require 'pry'
binding.pry
