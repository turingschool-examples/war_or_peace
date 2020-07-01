class Card

  #create variables as well as get and set methods
  attr_reader :suit, :value, :rank

  def initialize (suit, value, rank)
    @suit  = suit
    @value = value
    @rank  = rank
  end

end
