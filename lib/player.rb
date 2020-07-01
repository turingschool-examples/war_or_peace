require './lib/deck'

class Player

  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  #returns false if deck has >1 card
  #returns true if no cards in deck
  def has_lost?
    if @deck.cards.length == 0
      return true
    else
      return false
    end
  end

end
