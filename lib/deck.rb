# deck class


class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(int)
    @cards[int].rank
  end


  def high_ranking_cards
    high_ranking_array = []
    cards.each do |card_rank|
      if card_rank.rank >= 11 == true
        high_ranking_array << card_rank
      end
    end
     high_ranking_array
  end

  def percent_high_ranking
    percent = (high_ranking_cards.length.to_f / cards.length.to_f) * 100
    percent.round(2)
  end

  def remove_card
    @cards.shift
    # return cards
  end

  def add_card(card)
    @cards << card
  end

end
