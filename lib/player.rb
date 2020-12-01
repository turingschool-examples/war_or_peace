class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
    @lost = false
  end

  def lost?
    if @deck.cards.count == 0
      @lost = true
    end
    return @lost
  end

end
