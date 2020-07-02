class Deck
  attr_reader :cards, :rank

  cards = []


  def initialize (cards)
    @cards = cards
    @rank = rank
  end

  def rank_of_card_at(position)
    @cards[position].rank
  end

  def high_ranking_cards
    # high_ranks = []
    # @cards.each do |card|
    #   if card.rank >= 11
    #     high_ranks << card
    #   end
    # end
    # high_ranks
    @cards.find_all do |card|
      card.rank >= 11

    end
  end



end
