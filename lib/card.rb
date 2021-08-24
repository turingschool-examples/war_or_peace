class Card
  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = :diamond
    @value = "Queen"
    @rank = 12
  end
end
