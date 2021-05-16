class Player
  attr_reader :name, :deck, :cards

  def initialize(name, deck)
    @name = name
    @deck = deck
    @cards = cards
  end

  # Checks to see if the player has 
  def has_lost?
    return false if @deck.cards.length != 0
    true
  end

end
