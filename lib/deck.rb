class Deck
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_num)
    return @cards[index_num][2]
  end

  def high_ranking_cards
    new_array = []
    @cards.each do |card|
      if card[2] >= 11
        new_array.push(card)
      end
    end
    p new_array
  end
end
