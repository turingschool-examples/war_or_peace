class Deck
  attr_reader :cards

  def initialize(c = [])
    @cards = c
  end

  def rank_of_card_at(index)
    self.cards[index].nil? ? 0 : self.cards[index].rank
  end

  def high_ranking_cards
    cards.find_all {|c| c.rank > 10}
  end

  def percent_high_ranking
    decimal_value = self.high_ranking_cards.size / cards.size.to_f
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
