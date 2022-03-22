class Deck

  attr_reader :cards

  #Initialize the Deck with an array of Card objects
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    rank = @cards[index].rank
    return rank
  end

  


end
