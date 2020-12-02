class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(card_index)
    card = self.cards.at(card_index)
    card.rank
  end

  def high_ranking_cards
    self.cards.select do |card|
      card unless card.rank < 10
    end
  end

  def percent_high_ranking
    ((high_ranking_cards.count.to_f / self.cards.count.to_f) * 100).round(2)
  end

  def remove_card
    self.cards.shift
  end

  def add_card(card)
    self.cards << card
  end
end
