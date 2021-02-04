class Deck
  attr_reader :cards

  def initialize(c = [])
    @cards = c
  end

  def rank_of_card_at(index)
    cards[index].nil? ? 0 : cards[index].rank
    # cards[index]&.rank || 0
  end

  def high_ranking_cards
    cards.find_all {|c| c.rank > 10}
  end

  def percent_high_ranking
    decimal_value = high_ranking_cards.size / cards.size.to_f
    (decimal_value * 100).round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards.push(card)
    card
  end

end
