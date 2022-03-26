require './card'


class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    card = @cards[index]
    return card.rank
  end

  def high_ranking_cards
    high_rank_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_rank_cards << card
      end
    end
    return high_rank_cards
  end

  def percent_high_ranking
    (high_ranking_cards.count / @cards.count) * 100
  end

  def remove_card
    card.pop
  end

  def add_card
    card.push
  end
end
