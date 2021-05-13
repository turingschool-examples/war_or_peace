class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(rank)
    @cards.each do |card|
      rank == card.rank
      rank_of_card_at(rank)
    end
  end
end
