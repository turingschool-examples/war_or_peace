class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if @deck.cards.count > 3
      lost = false
    else
      lost = true
    end
    return lost
  end

end
