class Player
  attr_reader :name,
              :deck

  attr_accessor :lost

  def initialize(name, deck)
    @name = name
    @deck = deck
    @lost = false
  end

  def has_lost?
    @deck.cards.length == 0
  end

end
