class Deck
  attr_reader :cards

  def initialize(deck)
    @deck = deck
    @cards = []
  end
  
  def add_card(card)
    @cards << card
  end
end
