class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end


  def rank_of_card_at(place)
    @cards[place].rank
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
    card_count = @cards.count
    percent = high_ranking_cards.count.to_f.truncate(3) / card_count.to_f.truncate(3)
    return (percent * 100).round(2)
  end

  def remove_card
    @cards.delete_at(0)
  end

  def add_card(new_card)
    @cards.push(new_card)
  end
end
