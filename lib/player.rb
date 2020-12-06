class Player

attr_reader :name, :deck, :cards

  def initialize (name, deck)
    @name = name
    @deck = deck
    @cards = []
  end

  def has_lost?
    if self.deck.cards.count == 0
      true
    else
      false
    end
  end
end
