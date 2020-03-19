class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if deck.cards.length == 0
    #if deck.cards.length < 3
      true
    elsif deck.cards.length > 0
    #elsif deck.cards.length >= 3
      false
    end
  end

end
