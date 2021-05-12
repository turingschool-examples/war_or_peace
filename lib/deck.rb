class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
    # this method will take one argument
    # that represents the index location of
    # a card to be used and will return the
    # rank of that card
  end

  def high_ranking_cards
    # if cards[0].rank >= 11
    #     high_rank << cards[0]
    # end
    # if cards[1].rank >= 11
    #     high_rank << cards[1]
    # end
    # if cards[2].rank >= 11
    #     high_rank << cards[2]
    # end

    cards[0..2].select do |var|
      var.rank > 11
    end
  end

  def percent_high_ranking
  end

  def remove_card
  end

  def add_card
  end

end
