class Card
  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  def suit
    @suit
  end

  def value
    @value
  end

  def rank
    @rank
  end
end

class Deck
  attr_reader

  def initialize(cards)
    @deck = [cards]
  end

  def rank_of_card_at(cut)
    cards.index_at(cut)
  end

  def high_ranking_cards
    face_cards = @cards.select {|rank| rank >= 11}
  end

  def percent_high_ranking
    percentage = (face_cards / @cards.length) * 100
    return percentage
  end

  def remove_card
    @cards.pop(0)
  end

  def add_card
    @cards.unshift(-1)
  end

end
