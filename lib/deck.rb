class Deck 
  attr_reader :cards, :high_cards, :new_card, :index_location, :rank_of_card_at, :high_ranking_cards 
  def initialize(cards)
    @cards = cards  
    # @new_card = new_card  
    # @high_ranking_cards = high_ranking_cards
    # @high_cards = high_cards

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
    # high_cards = []
    # @cards.each do |card|
    #   if card.rank >= 11
    #     high_cards << card 
    #   end 
    # end
    @cards.find_all do |card|
      card.rank >= 11
    end 

    # high_cards 
  end  
  
  def percent_high_ranking
    ((high_ranking_cards.count.to_f / @cards.count) * 100).round(2) 
    # count_high = @high_ranking_cards.count.to_f/@cards.count
    

    # require 'pry'; binding.pry 

  end 
   
  def remove_card
    @cards.shift 
  end 
 
end 

# require 'pry'; binding.pry 