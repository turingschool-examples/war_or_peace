class Card
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
  @suit = suit
  @value = value
  @rank = rank
  end

end


card = Card.new(:heart, "Ace", 14)
card = Card.new(:diamond, "Queen", 12)
card = Card.new(:heart, "Jack", 11)
card = Card.new(:spade, "3", 3)
