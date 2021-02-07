# require 'pry'
class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_value)
    @cards[index_value].rank
  end

  def high_ranking_cards
    hrc = []
    @cards.each do |card|
      if card.rank >=11
        hrc << card
      end
    end
    hrc
  end

  def percent_high_ranking
  # divide the high ranking cards by the total number of cards.
  (high_ranking_cards.count.to_f / cards.count.to_f).round(4) * 100
  end
  def remove_card
    # cards - card1
    @cards.shift
  end

  def add_card(card4)
    @cards << card4
  end

end
