
class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end
  def rank_of_card_at(index)
    @cards[index].rank
  end
  def high_ranking_cards
    @cards.select{|card| card.rank > 11}
  end
  def percent_high_ranking
    (self.high_ranking_cards.size.to_f / @cards.size * 100).round(2)
  end
  def remove_card(num = 1)
    @cards.shift(num)
  end
  def add_card(card)
    @cards << card
  end
end
