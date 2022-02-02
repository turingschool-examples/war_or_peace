class Deck

  attr_reader :cards,
              :high_ranking_cards,
              :total_high_ranking_cards,
              :total_cards,
              :percent_high_ranking

  def initialize(cards)
    @cards = cards
    @high_ranking_cards = []
    @total_high_ranking_cards = 0
    @total_cards = @cards.length
    @percent_high_ranking = 0.0
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def sort_high_ranking_cards
    @cards.each do |card|
      if card.rank >= 11
        @high_ranking_cards.push(card)
      end
    end
  end

  def count_high_ranking_cards
    @total_high_ranking_cards = @high_ranking_cards.length
  end

  def calculate_percent_high_ranking
    @total_cards = @total_cards.to_f
    @total_high_ranking_cards = @total_high_ranking_cards.to_f
    @percent_high_ranking = (@total_high_ranking_cards / @total_cards) * 100.0
    @percent_high_ranking = @percent_high_ranking.round(1)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end

end
