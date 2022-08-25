class Deck 
  attr_reader :cards, :add_card, :new_card, :index_location, :rank_of_card_at
  def initialize(cards)
    @cards = cards  
    @new_card = Card.new(:suit, :value, :rank) 
     
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
  end 

  def remove_card
    #use .shift method 
  end 
 
end 

# require 'pry'; binding.pry 