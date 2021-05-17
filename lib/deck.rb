class Deck
  attr_reader :cards#, :new_card, :high_ranking_cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_ranking_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_ranking_cards << card
      end
    end
    return high_ranking_cards
  end

  def percent_high_ranking
    (self.high_ranking_cards.count.to_f / @cards.count * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(new_card)
    @cards << new_card
  end
end
