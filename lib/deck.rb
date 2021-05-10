class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.find_all { |card| 11 <= card.rank}
  end

  def percent_high_ranking
    percent = (high_ranking_cards.size.to_f/@cards.size) * 100
    percent.round(2)
  end

end
