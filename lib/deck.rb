require './lib/card'

class Deck
  attr_reader :cards, :high_cards

  def initialize(cards_param)
    @cards = cards_param
  end

  def rank_of_card_at (location)
    if cards[location] == nil
      card_rank = 0
    else card_rank = cards[location].rank
    end
  end

  def high_ranking_cards

    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards

  end

  def percent_high_ranking
    high_rank_length = high_ranking_cards.length
    ((high_rank_length / @cards.length.to_f) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card (suit_param, value_param, rank_param)
    new_card = Card.new(suit_param, value_param, rank_param)
    @cards << new_card
  end

end
