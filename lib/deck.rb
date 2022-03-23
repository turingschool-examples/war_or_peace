class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def high_ranking_cards
    high_ranking_cards = @cards.select do |card|
      card.rank > 10
    end
  end

end
