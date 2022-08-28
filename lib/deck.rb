class Deck 
  attr_reader :high_cards, :new_card, :index_location, :high_ranking_cards 
  attr_accessor :cards, :remove_card, :rank_of_card_at
  def initialize(cards)
    @cards = cards 
  end 

  def add_card(new_card)
    @cards << new_card
  end 

  def rank_of_card_at(index_location)
    @cards[index_location].rank
  end 

  def high_ranking_cards
    @cards.find_all do |card|
      card.rank >= 11
    end 
  end  
  
  def percent_high_ranking
    ((high_ranking_cards.count.to_f / @cards.count) * 100).round(2) 
  end 
   
  def remove_card
    @cards.shift(1)
  end 
 
end 

