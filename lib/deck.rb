class Deck
  attr_reader :cards, :rank_of_card_at, :high_ranking_cards, :percent_high_ranking
  def initialize(cards)
    @cards = cards
    @high_cards = high_cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
    if card.rank >= 11
      high_cards << card
    end
  end
    high_cards
  end

  def high_cards
    @high_cards
  end

  def percent_high_ranking
    (@high_cards.count / @cards.count ).round(2)
  end
end
