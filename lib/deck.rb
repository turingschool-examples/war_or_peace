class Deck 
  attr_reader :cards 

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(given_index)
    @cards[given_index].rank
  end

  def high_ranking_cards 
    @cards.map do |card| 
      if card.rank >= 11 
        card
      end
    end.compact
  end
end