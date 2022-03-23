require './lib/card'

class Deck

  attr_reader :cards

  #Initialize the Deck with an array of Card objects
  def initialize(cards)
    @cards = cards
  end

  #takes an integer as its parameter, returns the rank of the card at that index
  def rank_of_card_at(index)
    rank = @cards[index].rank
    return rank
  end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      rank = card.rank
      if card.rank >=11
        high_cards << rank
      end
    end
    return high_cards
  end

end

# card1 = Card.new(:hearts, "Ace", 14)
# card2 = Card.new(:hearts, "Two", 2)
# cards = [card1, card2]
#
# deck = Deck.new(cards)
#
# high = deck.high_ranking_cards
