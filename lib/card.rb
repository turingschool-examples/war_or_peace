class Card
  attr_accessor :suit, :value, :rank
  def initialize(suit, value, rank)
    @rank = rank
    @suit = suit
    @value = value
  end
end
