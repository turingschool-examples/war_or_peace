require './lib/card'
require './lib/deck'

class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
    @lost = false
  end

  def has_lost?
    @lost
  end
end
