class Deck
  attr_reader :cards

  def initialize(cards)
  @cards = cards
  end

  def rank_of_card_at(card_number)
    cards[card_number].rank
  end
end
