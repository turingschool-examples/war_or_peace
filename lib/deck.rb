class Deck
  attr_reader :cards
  def initialize (cards)
    @cards = cards
  end

  #Method will take one argument that represents the index location of a card to be used and will return the rank of that card.
  def rank_of_card_at(index)
    @cards[index].rank
  end


  #Method will return an array of cards in the deck that have a rank of 11 or above (faces and aces)
  def high_ranking_cards

    high_rank = []

    cards.find_all do |card|
      card.rank >= 11
    end
  end
end
