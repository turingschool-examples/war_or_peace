class Player
  attr_reader :name, :deck, :cards

  #initialize
  def initialize(name, deck)
    @name = name
    @deck = deck
    @cards = cards
  end

  #has_lost? method called on player
  def has_lost?
    @deck.cards == []
  end
end
