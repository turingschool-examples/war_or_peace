class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = [cards]
  end

  def add_card (card) #add to the end
    @cards << card
  end

  def remove_card #remove the last card
    @cards.shift
  end
end
