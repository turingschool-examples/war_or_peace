class Deck
  attr_reader :cards, :high_rank

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    return 2 if cards[index] == nil
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

    # cards.select do |var|
    #   var.rank > 11
    # end

    high_rank = []
    cards.each do |num|
      if num.rank > 10
        high_rank << num
      end
    end
    high_rank
  end

  def percent_high_ranking
    # ranks = []
    # percent_low = []
    # cards[0..2].each do |var|
    #   ranks << var.rank
    # end
    # ranks.select do |var|
    #   percent << var.rank
    # end
    high_rank = []
    cards.each do |num|
      if num.rank > 10
        high_rank << num
      end
    end

    # a = cards.length
    # b = high_rank.length
    # c = b.to_f / a.to_f * 100
    # c.round(2)

    (high_rank.length.to_f / cards.length.to_f * 100).round(2)

  end

  def remove_card
    cards.shift
  end

  def add_card(new_card)
    cards.append(new_card)
  end

end
