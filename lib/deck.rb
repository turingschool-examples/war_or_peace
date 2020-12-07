class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if @cards[index] == nil
      return 0
    else
      @cards[index].rank
    end
  end

  def high_ranking_cards
    @cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    percent_high_ranking = (high_ranking_cards.length / @cards.count.to_f).round(4) * 100
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end
end
