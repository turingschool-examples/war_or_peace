class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def high_ranking_cards
    # This method returns an array of cards in the deck that have a rank
    # of 11 or above (face cards and aces)
    high_ranking_cards = @cards.select do |card|
      card.rank > 10
    end
  end

  def rank_of_card_at(index)
    # This method takes one argument that represents the index location of
    # a card to be used and returns the rank of that card
    @cards[index].rank
  end

  def percent_high_ranking
    # This method returns the percentage of cards that are high ranking
    (high_ranking_cards.count.fdiv(@cards.count) * 100).round(2)
  end

  def remove_card
    # This method removes the top card from the deck
    @cards.shift
  end

  def add_card(new_card)
    # This method adds one card to the bottom (end) of the deck
    @cards.insert(-1, new_card)
  end

end
