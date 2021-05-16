class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards.at(index)
  end

  def high_ranking_cards
    @cards.map do |high_cards|
      high_cards>= 11
    end
  end

  def percent_high_ranking
    total_cards = @cards.length
    num_of_high_cards = high_ranking_cards.length
    percent_highcards = ((num_of_high_cards / total_cards) *100 .round(2)).to_f
  end

  def remove_card
    @cards.shift
  end

  def add_card
    @cards.push
  end
end
