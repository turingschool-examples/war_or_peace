


class Deck
   attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_cards_at(card_index)
    @card_index = card_index

    if cards[card_index] == nil
      0
    else
     cards[card_index].rank
    end
  end

  def high_ranking_cards
    cards.find_all do |card|
      card.rank >= 12
    end
  end


  def percent_high_ranking
    high_ranking_cards.length.to_f / cards.length.to_f * 100
  end

  def remove_card
    cards.shift
    @cards
  end

  def add_card(new_card)
    cards.push(new_card)
  end

  def is_empty?
    cards.length == 0
  end

  def cards
    @cards
  end

end

#card_51 = Card.new(:spades, "Queen", 12)
#card_52 = Card.new(:spades, "King", 13)
#deck1 = [card_51, card_52]
