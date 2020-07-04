class Player

  attr_reader :name, :deck
  def initialize(player_name, deck)
    @name = player_name
    @deck = deck

  end

  def has_lost?

    if @deck.cards == []
      true
    else
      false
    end
  end

end
