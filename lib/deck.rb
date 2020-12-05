
class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location)
    cards[index_location].rank
  end

  def high_ranking_cards
    cards.find_all do |card|
      card.rank > 10
  end

  def percent_high_ranking
    cards.find_all do |card|
      card.rank > 10
      
  end

  def remove_card

  end

  def add_card

  end

end
end
