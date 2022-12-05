class Deck 
attr_accessor :cards


def initialize(cards)
    # generatedcards are a local variable, then an instance variable when i put the at sign 
    @cards = cards
end 

def rank_of_card_at(index) 
   @cards[index].rank
end 
def remove_card
    @cards.shift
end 

def add_card(card) 
@cards = @cards.append(card)
return @cards 
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



end 