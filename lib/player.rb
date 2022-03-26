require './lib/card'
require 'pry'

class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
    # @lost = false
    # binding.pry
  end

  def has_lost?
    @deck.cards.length == 0
  end
end
