class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(cards)
    @cards[cards].rank
  end

  def high_ranking_cards
    royal_cards = []
    cards.each do |card|
      if card.rank > 10
        royal_cards << card
      end
    end
    royal_cards
  end  
end
