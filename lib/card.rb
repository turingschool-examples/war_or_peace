class Card
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @rank = rank
    @suit = suit
    @value = value
  end
end
