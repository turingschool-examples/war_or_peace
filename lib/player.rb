require './lib/card'
require './lib/deck'

class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end
  def has_lost?
    if deck.cards.count != 0
      return false
    else
        return true
    end
  end
end
