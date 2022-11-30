class Deck 
attr_reader :cards 
            :high_rankers

def initialize(arrayofcards)
    @cards = arrayofcards
    @high_rankers = []
end 

def cards
    @cards 
end 

def rank_of_card_at(index) 
   @cards[index].rank

end 

def high_ranking_cards 
    @cards.each do |card|
    if card.rank >= 11 
    
    @high_rankers << card
    # require 'pry'; binding.pry
    
    end 
end 
return @high_rankers
end 

def percent_high_ranking

    rawnumber = (@high_rankers.count).to_f / (@cards.count).to_f
    # require 'pry'; binding.pry
    
    percent = (rawnumber*100).round(2)
    return percent
end 

def remove_card
    deleted_card = @cards.first 
    @cards.delete(deleted_card) 
    @cards 
    
    # deleted_card = @cards.(0)
    # @cards.delete(deleted_card)
    # @cards
    # require 'pry'; binding.pry
    # if @high_rankers.rank.include?(@cards[0].rank)
        
    #      @high_rankers.delete(@cards[0])
    # end 
    # return @high_rankers
     
end 

def add_card(card) 
    @cards = @cards.append(card)
end 

end 