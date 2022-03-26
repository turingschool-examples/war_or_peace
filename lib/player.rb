require './lib/card'
require './lib/deck'

#require 'pry'

class Player
attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
  #  binding.pry
    if deck.cards.count == 0
      true
    else
      false
    end
  end

  def take_card
    @deck.cards.shift
  end
end
