require './lib/card'

class Card
  attr_reader :diamond,

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  def suit(suit)
  end

end
