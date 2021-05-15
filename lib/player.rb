class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
    @lost = false
  end

  def has_lost?
    if @deck.cards == []
      true
    else
      false
    end
  end

end
