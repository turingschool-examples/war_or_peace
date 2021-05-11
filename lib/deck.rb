class Deck
  attr_reader :cards
  def initialize (cards)
    @cards = cards
  end
  def rank_of_card_at (index)
    @cards[index].rank
  end
  def high_ranking_cards
    high_cards = @cards.select do |x|
      x.rank >= 11
    end
    return high_cards
  end
  def percent_high_ranking
    (@cards.high_cards.length / @cards.length) * 100
  end
  def remove_card
    @cards.shift
  end
  def add_card(card)
    @cards << card
  end
end
