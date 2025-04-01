class Player

  attr_reader :name, :deck

  def initialize(name,deck)
    @name = name
    @deck = deck
  end
  
  def has_lost?
    @deck.cards == []
    # could also use @deck.cards.empty?
    # either should return true when the cards array is empty
  end
  
end