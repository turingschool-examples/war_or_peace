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

  def short_hand?
    @deck.cards.size < 3 || @deck.cards.size == 0
  end

  def zero_check(i)
    if @deck.rank_of_card_at(i) == nil
      you_lose
    end
  end

end
