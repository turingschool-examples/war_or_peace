class Deck
  attr_reader :cards,
              :rank_of_card_at
              :index

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @index = index
    @rank_of_card_at = cards[index].rank
  end
end
