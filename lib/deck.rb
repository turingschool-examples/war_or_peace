class Deck
  attr_reader :cards

  def initialize(card_array)
    @cards = card_array
  end
  def rank_of_card_at(position)
  end
end

# what I've figured out so far
# calling deck.cards[0] calls the first card within the given cards
# this doesn't work in a method, since the variable needs to be redefined
