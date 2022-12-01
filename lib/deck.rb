class Deck 
attr_reader :cards, 
            :high_rankers

def initialize(cards)
    @cards = cards
    
end 

def cards
    @cards 
end 

def rank_of_card_at(index) 
   @cards[index].rank

end 

def high_ranking_cards
    high_rankers = []
    @cards.each do |card|
        if card.rank >= 11 
            high_rankers << card
        end
    end  
        @high_rankers = high_rankers
        return @high_rankers
end 

def percent_high_ranking
    rawnumber = (@high_rankers.count).to_f / (@cards.count).to_f
    percent = (rawnumber*100).round(2)
    return percent
end 

def remove_card
    deleted_card = @cards.first 
    @cards.delete(deleted_card) 
    @cards 
end 

def add_card(card) 
    @cards = @cards.append(card)
    return @cards 
end 

end 