require 'rspec'
require '../lib/deck'
require '../lib/card'
require '../lib/player'

RSpec.describe Player do
  diamondQ = Card.new(:diamond, 'Queen', 12)
  heart2 = Card.new(:heart, '2', 2)
  spadeA = Card.new(:spade, 'Ace', 14)
  club5 = Card.new(:club, '5', 5)
  cards = [diamondQ, heart2, spadeA, club5]
  deck = Deck.new([diamondQ, heart2, spadeA, club5])
  player1 = Player.new('Clarisa', deck)
    require "pry"; binding.pry
end
