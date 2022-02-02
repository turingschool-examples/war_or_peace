#Playing Card with suit,value and rank, Ace is highest
class Card

  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end
