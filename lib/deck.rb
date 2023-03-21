class Deck
  attr_accessor :cards,
                :high_rank,
                :percent_high_rank,
                :removed

  def initialize(cards)
    @cards = cards
    @high_rank
    @percent_high_rank
    @removed
  end

  def rank_of_card_at(num)
    cards[num].rank
  end

  def high_ranking_cards
    @high_rank = cards.select do |card|
      card.rank >= 11
    end
    return @high_rank
  end

  def percent_high_ranking
    @high_rank = cards.select do |card|
      card.rank >= 11
    end
    @percent_high_rank = ((high_rank.count.to_f / cards.count.to_f) * 100).round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards.push(card)
  end
end