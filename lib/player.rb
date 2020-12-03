class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
    @lost = false
  end

  def lost?
    @deck.cards.length == 0
  end

end
