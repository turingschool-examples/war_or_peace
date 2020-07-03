require './lib/card'

class Deck
  attr_reader :cards, :high_cards
  # initialize: this method will take one argument - an array of cards.
  # cards: an attr_reader to read the @cards attribute

  def initialize(cards_param)
    @cards = cards_param
  end
  #
  def rank_of_card_at (location)
    if location == 0
      card_rank = cards[0].rank
    elsif location == 2
      card_rank = cards[2].rank
    else
      card_rank = nil
    end
    card_rank
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

  # def add_card (suit_param, value_param, rank_param)
  #   new_card = Card.new
  # end
# add_card: this method will add one card to the bottom (end) of the deck

end
