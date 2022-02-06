class Player
  attr_reader :name,
              :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if deck.cards.count > 0
      false
    elsif deck.cards[2] ==  nil
      true
    else
      true
    end
  end
end
