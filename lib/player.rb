class Player
  attr_reader :name, :deck, :lost

  def initialize(name, deck)
    @name = name
    @deck = deck
    @lost = false
  end

  def has_lost?
    if deck.cards.length == 0
      player_loses
    else
      @lost
    end
  end

  def player_loses
    @lost = true
  end

end
