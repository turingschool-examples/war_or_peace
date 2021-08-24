class Deck
  attr_reader :cards

  def initialize(card_array)
    @cards = card_array
  end
  def rank_of_card_at(position)
    @position = position
    return card_array(position)
  end
end
