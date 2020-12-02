class Card
  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end

card = Card.new(:heart, "Queen", 12)

p card
