class Player
  attr_reader :name,
              :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    deck_hand = @deck.size
    if deck_hand > 0
      false
    else
      true
    end
  end


end
