require './lib/card'
require './lib/deck'

class Player
  attr_reader :deck, :name

  def initialize(name, deck)
    @deck = deck
    @name = name
  end

  def has_lost?
    if deck.cards == []
      return true
    else
      return false
    end
  end
end
