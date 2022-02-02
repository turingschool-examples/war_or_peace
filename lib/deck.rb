class Deck
  # initialize a deck of cards, passed an array of cards
  attr_reader :cards
  def initialize (cards)
  end

  def cards
    @cards = cards
    return @cards
  end

  # take one argument that represents the index location of a card to be used
  def rank_of_card_at (index)
      return @cards[index].rank
  end

  # return an array of cards in the deck that have a rank
  # of 11 or above (face cards and aces)
  def high_ranking_cards
    @high_ranking_cards = []
    #build high rank card array
    @cards.each do |card|

      if card.rank >= 11
        @high_ranking_cards.push(card)
      end
    end
    return @high_ranking_cards
  end

  # return the percentage of cards that are high ranking
  def percent_high_ranking

    numerator = @high_ranking_cards.length.to_f
    denomanotor = @cards.length.to_f
    percent_high = (numerator / denomanotor) *100

    return percent_high.round(2)
  end

  #method to remove a card from the top of the deck
  def remove_card
    @cards.pop
  end

  #method to add a card to the bottome of the deck
  def add_card (card_to_be_added)
    @cards.push(card_to_be_added)
  end
end
