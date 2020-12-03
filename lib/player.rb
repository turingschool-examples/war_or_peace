class Player

attr_reader :name, :deck

  def initialize (name, deck)
    @name = name
    @deck = deck
    @cards = []
  end

  def has_lost?

    if self.deck.cards == []
      return true

    else
      return false

    end
  end
end
