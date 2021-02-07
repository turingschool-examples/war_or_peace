class Deck

attr_reader  :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    return 0 if @cards[index] == nil
    @cards[index].rank
  end

  # take the existing array, filter thru rank >= 11
    def high_ranking_cards
      high_cards = []
      @cards.each do|card|
          if card.rank >= 11
            high_cards << card
          end
      end
        high_cards
    end

  def percent_high_ranking
    # count elements in the high ranking new array and divide it by the original array and multiply by a 100%
    (high_ranking_cards.count / @cards.count.to_f * 100).round(2)
  end

  def remove_card
    # remove the top card from the deck
    @cards.shift
  end


  def add_card(card)
    # add one card to the bottom (end) of the deck
    @cards << card
  end

end
