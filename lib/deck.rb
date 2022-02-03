class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def high_ranking_cards
    high_rank = []
    cards.each do |num|
      if num.rank > 10
        high_rank << num
      end
    end
    high_rank
  end
end
