class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_num)
    return @cards[index_num].rank
  end

  def high_ranking_cards
    new_array = []
    @cards.each do |card|
      if card.rank >= 11
        new_array.push(card)
      end
    end
    return new_array
  end

  def percent_high_ranking
    ((high_ranking_cards.length).to_f.round(2) / (@cards.length).to_f.round(2)) * 100
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end
end
