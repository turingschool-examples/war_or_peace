class Deck
  attr_reader :cards
              :high_cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location_of_card)
    cards[index_location_of_card].rank
  end

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    (high_ranking_cards.count / cards.count) * 100
    #this method will return the percentage of cards that are high ranking
  end

  def remove_card
    cards.delete_at(0)
    #this method will remove the top card from the deck
  end

  def add_card(card)
    cards.append(card)
    #this method will add one card to the bottom (end) of the deck
  end
end
