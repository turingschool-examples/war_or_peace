class Deck
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(location)
    return @cards[location].rank
  end

  def high_ranking_cards
    high_cards = @cards.select do |card|
      card.rank >11
    end
    return high_cards
  end

  def percent_high_ranking
    high_cards = self.high_ranking_cards
    return (high_cards.length.to_f / @cards.length.to_f) * 100
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.unshift(card)
  end
end
