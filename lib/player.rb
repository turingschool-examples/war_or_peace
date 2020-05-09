class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
    @lost = false
  end

  def has_lost?
    @deck.cards.empty? || @lost
  end

  def you_lose
    @lost = true
  end

  def hand
    @deck.cards
  end

  def nil_check(i)
    if @deck.rank_of_card_at(i) == nil
      p "No card at position #{i}"
      @lost == true
    end
  end

end
