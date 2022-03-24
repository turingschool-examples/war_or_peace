require "./lib/card"
require "./lib/deck"

class Deck
  attr_reader :card, :suit, :rank, :value
  def initialize
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
  end

end
