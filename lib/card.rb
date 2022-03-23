class Card
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end

card = Card.new(:heart, 'Jack', 11)
card1 = Card.new(:diamond, "Queen", 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
#card4 = Card.new(:club, '5', 5)
