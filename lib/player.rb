class Player
  attr_reader :name,
              :deck
              :lost

  def initialize(name, deck)
    @name = name
    @deck = deck
    @lost = false
  end

  def has_lost?
    if deck.cards == []
      @lost = true
    end
    @lost
  end
end
