class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    # @deck.cards.count == 0
    if @deck.cards.count > 2
      lost = false
    else
      lost = true
    end
    return lost
  end

end
