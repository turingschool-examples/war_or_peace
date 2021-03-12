class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.map do |card|
      if card.rank >= 11
      card
      end
    end.compact
  end

  def percent_high_ranking
     percent = high_ranking_cards.count.to_f / @cards.count.round * 100
     percent.round(2)
  end
end
