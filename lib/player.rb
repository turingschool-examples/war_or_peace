require './lib/deck'

class Player

  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  #returns true if player has fewer than 4 cards
  def has_lost?
    @deck.cards.length < 4
  end

end
