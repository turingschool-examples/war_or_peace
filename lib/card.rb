class Card
attr_reader :rank, :suit, :value

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  
end
