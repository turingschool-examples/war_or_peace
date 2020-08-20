 # A Player is initialized with a deck,
 # and can determine if they have lost the game.
class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if deck.cards == []
      true
    else
      false
    end
  end


end
