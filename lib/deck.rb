class Deck
  attr_reader :cards, :high_cards
  def initialize(cards)
    @cards = cards
    @high_cards = []
  end
  def rank_of_card_at(index)
    return @cards[index].rank
  end
  def high_ranking_cards
    cards.each do |card|
      if card.rank > 10
      @high_cards << card
    end
  end
  end
  # def percent_high_ranking
  
  # end
  # def remove_card
  # end
  # def add_card
  # end
end
  



# high_ranking_cards: this method will return an array of cards in the deck that have a rank of 11 or above (face cards and aces)
# percent_high_ranking: this method will return the percentage of cards that are high ranking
# remove_card: this method will remove the top card from the deck
# add_card: this method will add one card to the bottom (end) of the deck