class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    return nil if cards.empty?
    cards[index].rank
  end

  def high_ranking_cards
    cards.select { |card| card.rank > 10 }
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards << card
  end
end
