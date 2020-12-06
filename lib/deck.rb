require 'pry'

class Deck
  attr_reader :cards

  def initialize (cards)
    @cards = cards
  end


  def rank_of_card_at(i) (cards)
    @cards[i].rank
  end


  def high_ranking_cards
    @cards.select {|card| card.rank >=12}
  end

  def percent_high_ranking
    numer = cards.select {|card| card.rank >=12}.count
    dem = cards.count
    result = (numer.to_f / dem.to_f) * 100
    result.round(2)
  end

  def remove_card
    cards.delete_at(0)
  end

  def add_card (new_card)
    @cards << new_card
  end

end
