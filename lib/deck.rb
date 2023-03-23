class Deck
  attr_accessor :cards, :high_rank, :percent_high_rank, :removed, :rank_of_card_at

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(num)
    if cards[num] == nil
      return 0
    else
      cards[num].rank
    end
  end

  def high_ranking_cards
    @high_rank = cards.select {|card| card.rank >= 11}
  end

  def percent_high_ranking
    @high_rank = cards.select {|card| card.rank >= 11}
    @percent_high_rank = ((high_rank.count.to_f / cards.count.to_f) * 100).round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards.push(card)
  end
end