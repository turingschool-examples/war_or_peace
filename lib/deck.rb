class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    # determine the rank of the card
    # find the rank at index of card array
    cards[index].rank
  end

  def high_ranking_cards
    # create face cards array
    face_cards = []
    # iterate over the cards array.
    # if the card rank is 11 or above, add to array
    cards.each do |card|
      if card.rank >= 11
        #puts "card rank #{card.rank}"
        face_cards << card
      end
    end
    return face_cards
  end

  def percent_high_ranking
    # high_ranking_cards
    # # compare length of face_cards array to cards array
    # (face_card_length.to_f / cards.length.to_f * 100).round(2)
    face_cards = []
    cards.each do |card|
      if card.rank >= 11
        face_cards << card
      end
    end
    (face_cards.length.to_f / cards.length.to_f * 100).round(2)
  end


  def remove_card
    cards.shift
  end

  def add_card(card)
    cards << card
  end

end
