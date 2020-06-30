class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end
  # 
  # def high_ranking_cards
  #
  # end
  #
  #
  #   : this method will return an array of cards in the deck that have a rank of 11 or above (face cards and aces)
end
