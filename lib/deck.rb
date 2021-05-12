class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    for @cards.at(index)
      return @rank
    end
  end
end
