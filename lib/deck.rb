require './lib/card'

class Deck

  attr_reader :cards, :percent

  def initialize(cards)
    @cards = cards
    @high_ranking_cards = []
    @percent = percent
  end

  def rank_of_card_at(position)
    cards[position].rank
  end

  def high_ranking_cards
    @high_ranking_cards = @cards.select { |cards| cards.rank >= 11}
  end

  def percent_high_ranking
      high_ranking_cards
    @percent =  (((@high_ranking_cards.count.to_f) / (@cards.count.to_f)) *100).round(2)
  end

  def remove_card
      cards.shift
  end

  def add_card(card_to_add)
      @cards.append(card_to_add)
  end
end
