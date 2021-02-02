class Card
  attr_reader :suit,
              :value,
              :rank
  def initialize(suit, rank, value)
    @suit = suit
    @rank = rank
    @value = value
  end
end
