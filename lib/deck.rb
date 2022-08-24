class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    @percent = 0.0
  end
  def rank_of_card_at(index)
    @cards[index].rank
  end
  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      if(card.rank > 10)
        high_cards << card
      end
    end
    high_cards
  end
  def percent_high_ranking
    high_cards = []
    @cards.each do |card|
      if(card.rank > 10)
        high_cards << card
      end
    end
    @percent = high_cards.length / @cards.length
  end
end
