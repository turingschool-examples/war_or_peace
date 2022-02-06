require 'rspec'

require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
class Card
  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

end
