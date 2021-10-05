require_relative 'deck'

class Player
  attr_reader :name, :deck

  def initialize(name, deck = Deck.new)
    @name = name
    @deck = deck
  end

  def has_lost?
    @deck.cards.size == 0
  end

end
