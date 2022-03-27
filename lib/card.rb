class Card

  attr_reader :suit, :value, :rank

  #Initialize method with the three attributes of a card
  #suit is a symbol, value is a string, rank is an integer
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

end
