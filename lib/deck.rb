class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    #change from [] to 'cards' - want to have state defining attribute
    # represent the argument that is being passed through the method.
  end

  def rank_of_card_at(index)
    card_rank = cards[index].rank
  end

  def high_ranking_cards
      cards.find_all do |card|
        card.rank >= 11
      end
  end

  def percent_high_ranking
    ((high_ranking_cards.length.to_f / cards.length) * 100).round(2)
  end

end

  # def percent_high_ranking
  #   # this method will return the percentage of cards that a high ranking
  #   # identify number of cards with high ranking
  #   # divide no# of high ranking cards with total number of cards
  #   # output the resulting percentage
  # end
  #
  # def remove_card
  #   # this method will remove the top card form the deck
  #   # array.pop
  # end
  #
  # def add_card
  #   # this method will add one card to the bottem (end) of the deck
  #   # array.insert(0, element)
  # end
