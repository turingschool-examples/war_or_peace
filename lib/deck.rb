class Deck
  attr_reader :cards
  def initialize(cards=[])
    @cards = cards
  end

  def rank_of_card_at(card_index)
    # index typically 0 or 2
    # returns rank of card
    @cards[card_index].rank
  end

  def high_ranking_cards
    # returns an array of cards in the deck
    # that have a rank of 11 or above
    @cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    # return percentage of cards
    # that are high ranking
    (self.high_ranking_cards.count.to_f / @cards.count.to_f * 100).round(2)
  end

  def remove_card
    # remove top card from the deck
    @cards.shift
  end

  def add_card(card)
    # add one card to bottom (end) of deck
    @cards << card
  end

end
