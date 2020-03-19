class Deck
  attr_reader :cards

  def initialize (card)
    @cards = card
  end

  def add_card (card)
    @cards << card
  end

  def remove_card
    @cards.shift
  end
end
