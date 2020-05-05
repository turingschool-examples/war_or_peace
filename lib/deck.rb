class Deck
  attr_reader :cards
  def initialize(cards=[])
    @cards = cards
  end

  def rank_of_card_at(card_index)
    # index typically 0 or 2
    # returns rank of card
  end

  def high_ranking_card
    # returns an array of cards in the deck
    # that have a rank of 11 or above
    # (face cards and aces)
  end

  def percent_high_ranking
    # return percentage of cards
    # that are high ranking
  end

  def remove_card
    # remove top card from the deck
  end

  def add_card
    # add one card to bottom (end) of deck
  end

end
