class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index) #returns the rank of a card in the @cards array
    @cards[index].rank
  end

  def high_ranking_cards #return an array of cards in the deck with rank 11 or above
  end

  def percent_high_ranking #return the percentage of cards that are high ranking
  end

  def remove_card #removes the top (beginning) card from the deck
  end

  def add_card #adds one card to the bottom (end) of the deck
  end

end
