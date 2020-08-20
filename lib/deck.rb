class Deck
  attr_reader :cards, :high_cards

  def initialize(cards)
    @cards = cards

  end

  def rank_of_card_at(index)
    @cards.at(index).rank
  end

  def high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
  end
  p high_cards
end

  # def percent_high_ranking
  #   percent = (count.to_f/@cards.count().to_f)*100
  # #   percent_high_cards = 0
  # #   cards.each do |card|
  # #     # if card == @high_cards
  # #     percent_high_cards << @high_cards / 52.to_f * 100
  # #   # end
  #   p percent
  # end

  def remove_card
    @cards.shift
    p cards
  end

  def add_card(card)
    @cards.push(card)
  end
end
