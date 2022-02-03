require './card'
require './deck'

class Player
  attr_reader :name, :deck #:has_lost?
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




end #final end
