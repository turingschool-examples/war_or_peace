class Card

  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @rank = rank
    @value = value
  end

end