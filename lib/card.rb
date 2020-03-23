# card class
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'







class Card
  attr_accessor :suit, :value, :rank, :start

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank

  end
end
