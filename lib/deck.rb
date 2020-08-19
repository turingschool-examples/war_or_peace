class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards

  end

  def rank_of_card_at(index)
    @cards.at(index).rank
  end

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
  end
  p high_cards
end

  def percent_high_ranking
    pecent = cards.high_ranking_cards.count / cards
  end
  p percent
end
