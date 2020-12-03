require 'pry'

class Deck
  attr_reader :cards
  attr_accessor :high_ranking

  def initialize(card_array)
    @cards = card_array
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.select do |card|
      card.rank > 10
    end
  end

  def percent_high_ranking
    card_count = @cards.length.to_f
    face_count = high_ranking_cards.length.to_f
    face_percent = ((face_count / card_count) * 100).round(1)
  end

end
