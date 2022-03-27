class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    @high_ranking = []
  end

  def rank_of_card_at(index)
    if @cards == []
      return
    else
      @cards[index].rank
    end
  end

  def high_ranking_cards
    @cards.each do |card|
      if card.rank > 10
      @high_ranking.push(card)
      end
    end
    return @high_ranking
  end

  def percent_high_ranking
   decimal = high_ranking_cards.count.to_f / @cards.count
   (decimal * 100).round(2)
  end

  def remove_card
   cards.shift
  end

  def add_card(card)
   cards.push(card)
  end
end
