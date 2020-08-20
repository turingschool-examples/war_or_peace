class Player
  attr_reader :deck, :name
  def initialize(name, deck)
    @deck = deck
    @name = name
  end

#need to fix this method
  def has_lost?
    if @deck == []
      true
    elsif @deck == @deck.cards.delete_at(0)
      false
    else @deck.remove_card.rank > @deck.remove_card.rank
      return false
    end
  end



end
