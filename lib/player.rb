class Player
  attr_accessor :deck,
                :name

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?

    if @deck.cards.count >= 1
      return false
    else
      return true
    end
  end
end
