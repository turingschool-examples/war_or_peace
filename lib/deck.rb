class Deck
  attr_reader :cards,
              :percent_high_ranking

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @rank_of_card_at = cards[index].rank
  end

  def high_ranking_cards
  #   @cards.find_all do |card|
  #     card.rank >= 11
  #   end
  # end
    @high_ranking_cards = []
    cards.each_with_index do |card, index|
      if rank_of_card_at(index) >= 11
        @high_ranking_cards << card
      end
    end
    @high_ranking_cards
  end

  def percent_high_ranking
    @percent_high_ranking = (high_ranking_cards.length.to_f / @cards.length) * 100
    @percent_high_ranking.round(2)
  end

  def remove_card
    @remove_card = cards.shift
  end

  def add_card(new_card)
    @add_card = cards.append(new_card)
  end
end
