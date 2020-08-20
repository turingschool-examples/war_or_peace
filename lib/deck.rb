class Deck
  attr_accessor :cards
  def initialize(cards = [])
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    high_card_count = self.high_ranking_cards.count.to_f
    card_count = @cards.count.to_f
    ((high_card_count / card_count).round(4)) * 100
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

end
