class Deck
  attr_reader :cards, :deck_size

  def initialize(cards)
    @cards = cards
    @deck_size = cards.size
  end

  def rank_of_card_at(card_ind)
    if cards[card_ind] != nil
      cards[card_ind].rank
    else
    end
  end

  def high_ranking_cards
    cards.each do |card_rank|
      if card_rank.rank < 11
        cards.delete(card_rank)
      end
    end
  end

  def percent_high_ranking
    high_rank = high_ranking_cards.size
    percent = high_rank.to_f / deck_size.to_f
    percent = percent * 100
    percent.round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards << card
  end

end
