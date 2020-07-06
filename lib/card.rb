# Not using this file currently
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require './lib/deck_generator'

class Card
  attr_accessor :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

end
