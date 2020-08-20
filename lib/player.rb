class Player
  attr_reader :name, :deck
  def initialize(name, deck = Deck.new())
    @name = name
    @deck = deck
  end

  def has_lost?
    if @deck.cards.length > 0
      false
    else
      true
    end
  end

  def remove_card
    @deck.cards.shift
  end

end
