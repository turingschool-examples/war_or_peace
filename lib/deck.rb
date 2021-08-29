class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location)
    @cards.at(index_location).rank
  end

  def high_ranking_cards

    @cards.find_all do |card|
      card.rank >= 11
    end
  end



  def percent_high_ranking
    (high_ranking_cards.count.to_f / cards.count.to_f).round(4) * 100
  end

  def remove_card
  #
  end
  #
  # def add_card
  #
  # end
end
