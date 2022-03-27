require './lib/card.rb'
require './lib/deck.rb'

class Player
  attr_reader :name, :deck

  def initialize (name, deck)
    @name = name
    @deck = deck
  end

  def remove_card
    @deck.shift
  end

  def has_lost?
     deck.cards.size == 0
  end

end
