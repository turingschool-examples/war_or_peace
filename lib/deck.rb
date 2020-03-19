require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if !@cards[index].nil?
      return @cards[index].rank
    else
      return @cards[index]
    end
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
    num_face_cards = high_ranking_cards.length.to_f
    ((num_face_cards / @cards.length.to_f) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(new_card)
    @cards << new_card
  end

end
