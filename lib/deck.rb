class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def add_card(card)
    #add card to end of the deck
    @cards << card
  end

  def high_ranking_cards
    #return an array of cards in the deck that have a rank of 11 or above
    high_cards = @cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    #return percentage of cards that are high ranking
    @high_cards = high_ranking_cards
    ((@high_cards.count / @cards.count.to_f) * 100).round(2)
  end

  def rank_of_card_at(index)
    #return rank of card at index
    card = @cards[index]
    card.rank
  end

  def remove_card
    #remove top card from the deck
    @cards.shift
  end
end
