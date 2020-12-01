class Deck
  attr_reader :cards

  def initialize (cards)
    @cards = cards
  end

  def rank_of_card_at (cards)
    @cards.slice[cards].rank
  end

  def high_ranking_cards
    high_rank_array = []
    cards.each do |card|
      if card > 11
        high_rank_array = [card]
      end
    end
  end

  def percent_high_ranking
    #return an array of cards in the deck rank >=11
  end

  def remove_card
    #remove top card from deck
  end

  def add_card
    #add card to end of Deck
  end

end
