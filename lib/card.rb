#WOW THIS FEELS BASIC. It has no behaviors but... it has attributes?
require 'rspec'

class Card
  attr_reader :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end
