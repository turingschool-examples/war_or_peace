require './lib/card'
require './lib/deck'

class Player
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end
end
