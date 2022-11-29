class Card
  attr_reader :suit

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank

  end

end