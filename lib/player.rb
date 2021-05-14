require './lib/card'
require './lib/deck'

class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    return false if @deck.cards.length >= 0

    true
  end

  
end
