class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location)
    @cards.at(index_location).rank
  end

  # def high_ranking_cards
  #   # if rank_of_card_at >= 11
  #   #   return []
  #   # end
  # end
  #
  # def percent_high_ranking
  # #  high_ranking_cards / 14
  # #  Hello   return
  # end
  #
  # def remove_card
  #
  # end
  #
  # def add_card
  #
  # end
end
