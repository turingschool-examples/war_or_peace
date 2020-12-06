class Player

attr_reader :name, :deck, :cards

  def initialize (name, deck)
    @name = name
    @deck = deck
    @cards = []
  end

  def has_lost?
    if @deck.cards == []
      true
    else
      false
    end
  end
end
