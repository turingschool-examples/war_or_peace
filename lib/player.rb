require './lib/card'
require './lib/deck'

class Player

  attr_reader :name, :deck

  #Initialize takes a string and a Deck object as arguments
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  #Returns a boolean, if the deck is empty return true otherwise return false
  def has_lost?
    if @deck.cards.empty?
      return true
    else
      return false
    end
  end

end
