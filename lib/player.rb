require './lib/card'
require './lib/deck'

class Player
  def initialize(name, deck)
    @name = name
    @deck = deck
  end
end
