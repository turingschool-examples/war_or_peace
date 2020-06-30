class Deck

  attr_accessor :cards

  def initialize(cards=[])
    @cards = cards
  end

  def rank_of_card_at(location)
    @cards[location].rank
  end

  def high_ranking_cards
    @cards.select{ |x|
      x.rank >= 11
    }
  end

  def percent_high_ranking
    (high_ranking_cards.length.to_f / cards.length.to_f).round(4) * 100
  end

  def remove_card
      @cards.shift
  end

  def add_card(card)
    @cards << card
  end

end
