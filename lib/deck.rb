
require_relative 'card'

class Deck

  attr_reader :deck, :rank_of_card_at, :high_ranking_cards, :percent_high_ranking
  def initialize(deck)
    @deck = deck
  end

  def rank_of_card_at(index)
    @rank_of_card_at = deck[index].rank
  end

  def high_ranking_cards
    big_cards = [] #must define before each loop
    @deck.each do |card|
      if card.rank >= 11
        big_cards << card
      end
    end
    return big_cards
  end

  def percent_high_ranking
    # big_cards= high_ranking_cards
    num_high = high_ranking_cards.count
    num_tot = deck.count
    @percent_high_ranking = num_high/num_tot
  end

  def remove_card
    deck.shift #shows removed cards if no return cards
  end

  def add_card(new_card)
    @deck << new_card
  end
end
