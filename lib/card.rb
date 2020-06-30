class Card
  attr_accessor :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  def high_ranking?
    @rank < 11 ? false : true
  end
end
