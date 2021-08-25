class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index) #returns the rank of a card in the @cards array
    @cards[index].rank
  end

  def high_ranking_cards #return an array of cards in the deck with rank 11 or above
    @high_cards = []

    @cards.each do |card|
      if card.rank >= 11
        @high_cards << card
      end
    end

  end

  def percent_high_ranking #return the percentage of cards that are high ranking
    @high_cards = []

    @cards.each do |card|
      if card.rank >= 11
        @high_cards << card
      end
    end

    @high_cards.length.to_f / @cards.length.to_f * 100
  end

  def remove_card #removes the top (beginning) card from the deck
    @cards.delete_at(0)
  end

  def add_card(card) #adds one card to the bottom (end) of the deck
    @cards << card
  end

end
