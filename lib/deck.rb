

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    @high_rank = []
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @high_rank = []
    @cards.map do |card|
        if card.rank > 10
          @high_rank << card
        end
    end
    return @high_rank
  end

  def percent_high_ranking
    percent = (@high_rank.length.to_f / @cards.length.to_f).round(4) * 100
  end

  def remove_card
    @cards.shift
  end

  def add_card

  end
end
