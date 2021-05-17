class Player

  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    # This method determines if the player has lost the game
    @deck.cards.empty?
  end

end
