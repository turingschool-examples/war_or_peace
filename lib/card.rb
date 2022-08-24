class Card
  attr_reader :suit,
              :rank,
              :value

  def initialize(suit, value, rank)
    @suit = suit
    @rank = rank
    @value = value
  end 
end 