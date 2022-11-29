class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end 

  def rank_of_card_at(position)
     card = @cards[position]
     card.rank
  end 

  def high_ranking_cards
    high_ranking_cards = @cards.find_all{|card| card.rank >= 11}
  end 

end 