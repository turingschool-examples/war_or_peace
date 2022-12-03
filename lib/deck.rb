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
    @high_rank_cards = @cards.find_all{|card| card.rank >= 11}
  end 

  def percent_high_ranking
    decimal_percent = @high_rank_cards.count.to_f / @cards.count.to_f
    percent = decimal_percent * 100
    percent.round(2)
  end 

  def remove_card
   @cards.shift   
  end 

  def add_card(card)
    @cards << card
  end 
end 