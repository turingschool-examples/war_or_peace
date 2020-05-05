class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards
    @cards
  end

  def rank_of_card_at(position)
    cards.at(position).rank
  end

  def high_ranking_cards
    cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    highvalue = []
    cards.each do |card|
      if card.rank >= 11
        highvalue.push(card)
      end
    end
    ((highvalue.count.to_f * 100) / (cards.count.to_f)).round(2)
  end

end
