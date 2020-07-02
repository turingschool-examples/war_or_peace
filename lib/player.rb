require './lib/deck'

class Player

  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  #returns true if no cards in deck
  def has_lost?
    @deck.cards.length == 0
  end

end
