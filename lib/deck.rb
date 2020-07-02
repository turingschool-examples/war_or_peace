class Deck
  attr_reader :cards, :rank

  cards = []

  def initialize (cards)
    @cards = cards
    @rank = rank
  end

  def rank_of_card_at(position)
    @cards[position].rank
  end

end
