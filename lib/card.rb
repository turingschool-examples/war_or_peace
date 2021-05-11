class Card
  attr_accessor :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

end

# card = Card.new("heart", "queen", "11")
# puts card.suit
# puts card.value
# puts card.rank
