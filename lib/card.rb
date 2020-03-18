class Card
  attr_reader :rank, :suit, :value, :cards

  def initialize(suit, value, rank)
    @rank = rank
    @suit = suit
    @value = value
    @cards = []
  end

  def get_cards(card)
    @cards << card
  end
end
