require './lib/card'
require './lib/deck'

class Player
  attr_reader(:name, :deck, :cards)
  def initialize(name, deck)
    @name = name
    @deck = deck
    @cards = cards

  end

  def has_lost?
    if @cards = []
      has_lost? = true
    else
      has_lost? = false
    end
  end







end
