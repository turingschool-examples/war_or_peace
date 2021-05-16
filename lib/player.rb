class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?(removed_card)
    if removed_card.rank <= 11
      true
    else
      false
    end
  end
end
