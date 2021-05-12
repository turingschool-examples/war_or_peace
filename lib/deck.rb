class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(position)
    @cards[position].rank
  end

  def high_ranking_cards
    # @cards.select { |card| card.rank >= 11 }
    @cards.select do |card|
      card.rank >= 11
    end
  end

  def add_card(card)
    @cards << card
  end
end
