class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @deck = deck
    @name = name
  end

  def name
    return name
  end

  def count
    count
  end

  def has_lost?
    if deck.cards.count == 0
      true
    else
      false
    end
  end
end
