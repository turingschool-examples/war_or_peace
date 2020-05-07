class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_ranking_cards = []
    @cards.each do |card|
      card.rank
      if card.rank >= 11
        high_ranking_cards << card
      end
    end
    high_ranking_cards
  end

  def percent_high_ranking
    (high_ranking_cards.count / @cards.count.to_f).round(4) * 100
  end

end
