class Deck 
  attr_reader :cards, :add_card, :high_cards, :new_card, :index_location, :rank_of_card_at, :high_ranking_cards
  def initialize(cards)
    @cards = cards  
    @new_card = Card.new(:suit, :value, :rank) 
    @high_ranking_cards = high_ranking_cards
    @high_cards = high_cards

  end 

  def add_card(new_card)
    @cards << new_card
  end 

  def index_location
    @cards.find_index 
  end 

  def rank_of_card_at(index_location)
    
    @cards[index_location].rank
  end 

  def high_ranking_cards
    @high_cards = []
    @cards.each do |card|
      if card.rank >= 11
        @high_cards << card 
      end 
    end
    @high_cards 
  end  
  
  def percent_high_ranking
    ((@high_ranking_cards.count.to_f / @cards.count.to_f) * 100).round(2) 
  end 
   
  def remove_card
    #use .shift method 
  end 
 
end 

# require 'pry'; binding.pry 