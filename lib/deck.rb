class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    high_cards = cards.select do |card|
      card.rank > 11
    end
    return high_cards
  end

  def percent_high_ranking
    high_cards = cards.select do |card|
      card.rank > 11
    end

    percentage = (high_cards.length.to_f / cards.length.to_f) * 100
    percentage.round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card4)
    cards << card4
  end


end
