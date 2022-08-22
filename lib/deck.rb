class Deck
attr_reader :cards

  def initialize(cards = [])
  @cards = cards
  end

  def cards?
  @cards
  end

  def new_deck(card)
    @cards << card
  end

end
