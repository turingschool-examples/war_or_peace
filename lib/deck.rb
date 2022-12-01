class Deck 
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.select do |card|
      card.rank > 10
    end
  end

  def percent_high_ranking
    (high_ranking_cards.count.fdiv(@cards.count) * 100).round(2)
  end
end


# remove_card: this method will remove the top card from the deck
# add_card: this method will add one card to the bottom (end) of the deck
