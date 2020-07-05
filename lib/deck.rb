class Deck

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if !@cards[index].nil?
    @cards[index].rank
  else
    0
  end
end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    percentage = high_ranking_cards.count.to_f / @cards.count * 100
    percentage.round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card
    @cards.push
  end
end
