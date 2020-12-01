class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(card_index)
    self.cards.find_at(card_index)
  end
end
