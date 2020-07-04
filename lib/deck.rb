class Deck
  attr_reader :cards, :rank




  def initialize (cards)
    @cards = cards
  end

  def rank_of_card_at(position)
    @cards[position].rank
  end

  def high_ranking_cards
    high_ranks = []
    @cards.each do |card|
      if card.rank >= 11
        high_ranks << card
      end
    end
    high_ranks
  end

  def percent_high_ranking
    high_ranks = []
    @cards.each do |card|
      if card.rank >= 11
        high_ranks << card
      end
    end
    ((100 / @cards.count.to_f) * high_ranks.count).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
