class Card
  attr_accessor :suit, :rank, :value
  def initialize(suit, value, rank)
    @suit = suit
    @rank = rank
    @value = value
  end

end

card = Card.new(:diamond, "Queen", 12)
