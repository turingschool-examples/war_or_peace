class Deck
  attr_reader :cards

  def initialize (cards)
    @cards = cards
  end


  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    high_ranking_cards = []
    cards.each do |card|
      if rank > 11 card == high_ranking_cards
      else 
    end
    # each card is looked at to see if it's high ranking.
    # If it is it goes into high_ranking_cards array
  end
end
