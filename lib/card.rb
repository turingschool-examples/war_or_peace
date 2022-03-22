class Card

  attr_reader :suit, :value, :rank

  # create initialize method with the three attributes of a card
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

end
