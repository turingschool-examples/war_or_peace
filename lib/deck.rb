class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(location)
    cards[location].rank
  end

  def high_ranking_cards
    high_rank = []
    cards.each do |card|
      if card.rank > 10
        high_rank << card
      end
    end
    high_rank
  end
end
