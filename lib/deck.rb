class Deck
  attr_reader :cards, :rank

  def initialize (cards)
    @cards = cards
    @rank = rank
  end

    def rank_of_card_at (rank)
      return rank
  end

  def high_ranking_cards
    if rank > 11
      then return array
    end
  end

  def percent_high_ranking
    num = cards.count
    num/52 *100
  end

  def remove_card
  end

  def add_card
  end


end
