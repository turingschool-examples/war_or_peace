require './lib/card'
require './lib/deck'

class Player

  attr_accessor :name, :deck

  def initialize (name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if @deck.cards == []
      return true
    else
      return false
    end
  end
end
