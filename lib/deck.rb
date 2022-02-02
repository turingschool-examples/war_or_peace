class Deck

  # initialize a deck of cards, passed an array of cards
  attr_reader :cards
  def initialize (cards)
    @cards = cards
  end

  def cards
    return @cards
  end

  # take one argument that represents the index location of a card to be used
  def rank_of_card_at (index)
      return @cards[index].rank
  end

  # return an array of cards in the deck that have a rank
  # of 11 or above (face cards and aces)
#  def high_ranking_cards
#  end

  # return the percentage of cards that are high ranking
#  def percent_high_ranking
#  end

  #method to remove a card from the top of the deck
#  def remove_card
#  end

  #method to add a card to the bottome of the deck
#  def add_card
#  end

end
