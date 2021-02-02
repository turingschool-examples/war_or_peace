class Deck
  attr_reader  :cards

  def initialize(cards=[])
    @cards = cards
    @high_cards = []
    # @high_card_count = 0
  end

  def add_card(card)
    if card.rank > 10
      # @high_card_count += 1
      @high_cards << card
    end
    @cards << card
  end

  def rank_of_card_at(index)
    deck[index].rank
  end

  def high_ranking_cards
    @high_cards
  end

  def percent_high_ranking
    @high_cards.size / @cards.size
  end

  def remove_card
    @high_cards.shift
  end

end
