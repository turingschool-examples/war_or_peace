class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    @high_cards = []
  end
  def rank_of_card_at(index)
    @cards[index].rank
  end
  def high_ranking_cards
    @cards.each do |card|
      if(card.rank > 10)
        @high_cards << card
      end
    end
    @high_cards
  end
end
