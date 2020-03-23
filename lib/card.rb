class Card
  attr_reader :suit, :value, :rank
  def initialize(suit, card_value, rank)
    @suit = suit
    @value = card_value
    @rank = rank
  end
end
