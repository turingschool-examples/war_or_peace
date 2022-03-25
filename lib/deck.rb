class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards

  end

  def rank_of_card_at(index)
    return @cards[index].rank
  end

  def high_ranking_cards
        face_cards = []
    @cards.each do |card|
      if card.rank >= 11
        face_cards << card
      end
    end
  return face_cards
  end

  def percent_high_ranking
    # binding.pry
    percent = (high_ranking_cards.count.to_f / @cards.count.to_f) * 100
    percent.round(2)
  end

  def remove_card
    # binding.pry
    # @cards.delete_at(0)
    @cards.shift
  end

end
