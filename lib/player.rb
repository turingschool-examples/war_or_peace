require 'pry'

class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if deck.cards.length > 0
      return false
    else
      return true
    end
  end
end
