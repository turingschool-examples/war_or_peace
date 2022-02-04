require 'pry'

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if cards[index]
      cards[index].rank
    else
      0
    end
  end

  def high_ranking_cards
    @high_ranking_cards = []
    @cards.each do |card|
      if card.rank >= 11 && @high_ranking_cards.include?(card) == false
        @high_ranking_cards.push(card)
      end
    end
    return @high_ranking_cards
  end

  def percent_high_ranking
    @total_high_ranking_cards = @high_ranking_cards.length
    @total_cards = @cards.length
    @total_cards = @total_cards.to_f
    @total_high_ranking_cards = @total_high_ranking_cards.to_f
    @percent_high_ranking = (@total_high_ranking_cards / @total_cards) * 100.0
    @percent_high_ranking = @percent_high_ranking.round(1)
    return @percent_high_ranking
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end

end
