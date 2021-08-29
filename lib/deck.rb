class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location)
    @cards[index_location].rank
  end

  def high_ranking_cards
    high_ranking_cards = []

    @cards.each do |card|
      if card.rank >= 11
        high_ranking_cards << card
      end
    end
    high_ranking_cards
  end

  def percent_high_ranking

    dividend = (high_ranking_cards.count.to_f / @cards.count.to_f)
    (dividend * 100).round(2)
  end

  def remove_card
    @cards.delete_at(0)
  end

  def add_card(new_card)
    @cards << new_card
  end
end
