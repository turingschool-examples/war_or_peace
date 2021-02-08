class Deck
  attr_reader :cards

  def initialize(cards=[])
    @cards = cards
  end

  def add_card(card)
    @cards << card
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    cards.select {|card| card.rank > 10}
  end

  def percent_high_ranking
    (100* high_ranking_cards.size.to_f / @cards.size).round(2)
  end

  def remove_card
    cards.shift
  end

end
