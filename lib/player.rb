class Player
  attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if
      @deck.cards.count > 0
      false
    else
      @deck.cards.count <= 0
      true
    end
  end

  # def remove_card
  #   @deck.cards.delete_at(0)
  # end

end
