#require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location_of_card)
    cards[index_location_of_card].rank
  end

  def high_ranking_cards
    cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    high_cards = high_ranking_cards
    #((high_cards.count) / (cards.count)) * 100
    x = high_cards.count
    y = cards.count
    (x.to_f / y.to_f * 100.0).round(2)
  end

  def remove_card
    cards.delete_at(0)
  end

  def add_card(card)
    cards.append(card)
  end
end
