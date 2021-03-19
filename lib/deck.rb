class Deck
  attr_reader  :cards

  def initialize(cards)
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    (percent_math * 100).round(2)
  end

  def percent_math
    high_ranking_cards.length / cards.length.to_f
  end

  def remove_card
    @cards.shift
  end
end
