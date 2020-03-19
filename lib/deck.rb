class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_ranking_cards = []

    @cards.each do |card|
      if card.rank >= 11
        high_ranking_cards << card
      end
    end
    return high_ranking_cards
  end

  def percent_high_ranking
    highs = high_ranking_cards
    return (highs.length.to_f / @cards.length).round(4) * 100
    #this method will return the percentage of cards that are high ranking
  end

  def remove_card
    return # this method will remove the top card from the deck
  end

  def add_card
    return #this method will add one card to the bottom (end) of the deck
  end

end
