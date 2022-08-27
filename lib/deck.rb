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
  def percent_high_ranking
    ((@high_cards.count.to_f / @cards.count.to_f) * 100).round(2)
  end
  def remove_card
    @cards.shift
  end
  def add_card(card)
    @cards << card
  end
end
  



# remove_card: this method will remove the top card from the deck
# add_card: this method will add one card to the bottom (end) of the deck