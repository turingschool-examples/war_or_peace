class Deck
  attr_reader   :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location)
    return cards[index_location].rank
  end

  def high_ranking_cards
    cards.find_all do |card|
      card.rank >= 11
    end

  end

  def percent_high_ranking
    (((high_ranking_cards.count.to_f) / (cards.count.to_f)).round(2) * 100).to_i
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    @cards << card
  end

end
