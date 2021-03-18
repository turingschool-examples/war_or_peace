class Deck
  attr_reader  :cards

  def initialize(cards)
    @cards = []
  end

  def add_cards(card)
    @cards << card
  end
end
