class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    cards.select do |card|
      card.rank > 11
    end
  end

  def percent_high_ranking
    percentage = (high_ranking_cards.length.to_f / cards.length.to_f) * 100
    percentage.round(2)
  end

  def remove_card(index_position)
    cards.delete_at(index_position)
  end

  def add_card(card)
    cards << card
  end


end
