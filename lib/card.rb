class Card
  attr_reader :suit, :rank, :value

  def initialize(suit = :suit, rank = 'Rank', value = 0)
    @suit = suit
    @rank = rank
    @value = value
  end
end
