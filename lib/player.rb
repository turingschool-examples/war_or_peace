require '../lib/deck'

class Player

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if @deck.cards.count != 0
      return false
    else
      return true
    end
  end

  def name
    @name
  end

  def deck
    @deck
  end

end
