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

  def rank_of_card_at(ndex)
    ndex
  end

  def high_ranking_cards()
  end

  def percent_high_ranking
  end

  def remove_card
  end

  def add_card
  end

end

deck = Deck.new("cards")
