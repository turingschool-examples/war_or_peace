class Card
  attr_reader :suit, :value, :rank

  def initialize (suit = "", value = "", rank = 0)
    @suit = suit
    @value = value
    @rank = rank
  end

end
