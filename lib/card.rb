class Card
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end
card = Card.new(:diamond, 'Queen', 12)

p card
p card.suit
p card.value
p card.rank
