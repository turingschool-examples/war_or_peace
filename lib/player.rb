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
    if @deck.cards == []
      return true
    else
      return false
    end
  end


end # this is the end of the class!!!
