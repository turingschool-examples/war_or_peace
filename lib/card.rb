class Card
  attr_reader :suit, :rank, :value

  def initialize(suit, value, rank)
    @rank = rank
    @suit = suit
    @value = value
  end
end
