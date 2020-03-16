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
      if card.rank >= 11
        high_rank_cards << card
      end
    end
    high_rank_cards
  end

  def percent_high_ranking
    high_rank_cards = high_ranking_cards
    high_rank_cards.length.to_f/cards.length.to_f
  end
end
