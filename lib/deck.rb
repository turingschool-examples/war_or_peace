class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    high_rank_cards = []
    cards.each do |card|
      if is_high_ranking?(card)
        high_rank_cards << card
      end
    end
    high_rank_cards
  end

  def is_high_ranking?(card)
    card.rank >= 11
  end

  def percent_high_ranking
    (high_ranking_cards.length.to_f/cards.length.to_f * 100).round(2)
  end

  def remove_card
    return @cards.shift unless cards.length == 0
    @cards
  end

  def add_card(card)
    @cards << card
  end
end
