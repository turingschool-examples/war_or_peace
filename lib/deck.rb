class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    return 2 if @cards[index] == nil

    @cards[index].rank
  end

  # def high_ranking_cards
  #   high_rank = []
  #   cards.each do |num|
  #     if num.rank > 10
  #       high_rank << num
  #     end
  #   end
  #   high_rank
  # end
  def high_ranking_cards
    @cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    (high_ranking_cards.length.to_f / cards.length.to_f * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

  # def add_card(new_card)
  #   cards.append(new_card)
  # end
end
