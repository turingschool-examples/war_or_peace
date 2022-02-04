class Player

  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if @deck.cards.size == 0
      return true
    else
      false
    end
  end

end
