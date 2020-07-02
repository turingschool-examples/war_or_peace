class Deck

  attr_reader :cards

  def initalize(values)
    @cards = cards

  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
    if card.rank >= 11
    high_cards << cards
  end

  def percent_high_ranking
    (high_ranking_cards.count / @cards.count).to_f * 100
  end

  def remove_card
    @cards.shift

  end

  def add_card
    @cards.push
  end
end
