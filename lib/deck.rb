#deck class file
class Deck
  attr_reader :cards

  def initialize()
    is_high_rank = []
  end

  def rank_of_cards_at(index)
  end

  def high_ranking_cards()
    cards.each do |card_rank|
      if card_rank > 11
        is_high_rank << card_rank
      end
    end
  end

  def percent_high_ranking()

  end

  def remove_card()

  end

  def add_card()
  end
end
