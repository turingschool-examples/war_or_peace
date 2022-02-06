class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(location)
    if cards[2] == nil
      1
    else
      cards[location].rank
    end
  end

  def high_ranking_cards
    high_rank = []
    cards.each do |card|
      if card.rank > 10
        high_rank << card
      end
    end
    high_rank
  end

  def percent_high_ranking
    total_cards = cards.count
    high_rank_cards = []
    # high_rank_cards = 0
    # binding.pry
    cards.each do |card|
      if card.rank > 10
        high_rank_cards << card
      end
    end
    ((high_rank_cards.count.to_f / total_cards.to_f).round(4))*100
  end

  def add_card(new_card)
    cards << new_card
  end

  def remove_card
    cards.shift
  end
end
