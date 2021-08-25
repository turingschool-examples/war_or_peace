class Deck
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_num)
    return @cards[index_num][2]
  end
end
