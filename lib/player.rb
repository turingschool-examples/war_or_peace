class Player
  attr_reader :deck,
              :name

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if deck.cards.count == 0
      true
    else
      false
    end
  end
end
