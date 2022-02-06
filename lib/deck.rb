require './lib/card'

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)

cards = [ card1, card2, card3 ]

class Deck
  attr_reader :cards
  def initialize(c)
    @cards = c
  end
end

deck = Deck.new("cards")
