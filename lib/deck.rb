class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at()
    return #this method will take one argument that represents the index
    #location of a card to be used (typically 0 or 2 more on this later 😉 )
    #and will return the rank of that card.
  end

  def high_ranking_cards
    return #array of cards in the deck that have a rank of 11 or above (face cards and aces)
  end

  def percent_high_ranking
    return #this method will return the percentage of cards that are high ranking
  end

  def remove_card
    return # this method will remove the top card from the deck
  end

  def add_card
    return #this method will add one card to the bottom (end) of the deck
  end

end
