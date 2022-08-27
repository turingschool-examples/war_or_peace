require './lib/deck'
class Card
  attr_reader :rank, :suit, :value
  def initialize(suit, value, rank)
    @rank = rank
    @suit = suit
    @value = value
  end
end
