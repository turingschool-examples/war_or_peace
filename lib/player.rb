require_relative 'card'
require_relative 'deck'

class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = Deck.new(deck)
  end

  def has_lost?
    if @deck.deck == []
      true
    else
      false
    end
  end


end
