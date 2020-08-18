class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    @high_ranking_cards = []
    @got_all_high_ranking_cards = false
  end

  def high_ranking_cards
    @cards.find_all {|card| card.rank >= 11}
  end

  def rank_of_card_at(position)
    @cards[position].rank
  end

  def percent_high_cards
    ((high_ranking_cards.count / @cards.count.to_f) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end
end
