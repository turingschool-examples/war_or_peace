class Deck
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(location)
    #return @cards[location].rank
    cards[location].rank
  end

  def high_ranking_cards
    cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    ((high_ranking_cards.length.to_f / cards.length) * 100).round
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards.unshift(card)
  end
end
