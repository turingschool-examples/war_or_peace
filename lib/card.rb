require 'pry'
class Card
  attr reader :suit,
              :value,
              :rank

  def initialize(suit, value, rank)
    @suit     = suit
    @value    = value
    @rank     = rank
  end
end
