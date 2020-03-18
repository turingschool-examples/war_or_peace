class Card
  attr_accessor :suit, :rank, :value

  def initialize(suit, value, rank)
    @rank = rank
    @suit = suit
    @value = value
  end
end
