class Deck
  def initialize(cards)
    @cards = cards
  end

# an attr_reader to read the @cards attribute
  def cards
  end

# take one argument that represents the index location of a card
# to be used (typically 0 or 2) and will return the rank of that card
  def rank_of_card_at
  end

# return an array of cards in the deck that have a rank of 11 or above
# (face cards and aces)
  def high_ranking_cards
  end

# return the percentage of cards that are high ranking
  def percent_high_ranking
  end

# remove top card from deck
  def remove_card
  end

# add one card to the bottom (end) of the deck
  def add_card
  end
end
