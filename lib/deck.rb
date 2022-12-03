class Deck 
attr_accessor :cards


def initialize(cards)
    @cards = cards
    
end 

# def cards
#     @cards 
# end 

def rank_of_card_at(index) 
   @cards[index].rank
#    require 'pry'; binding.pry
   
end 

# def high_ranking_cards
#     high_rankers = []
#     @cards.each do |card|
#         if card.rank >= 11 
#             high_rankers << card
#         end
#     end  
#         @high_rankers = high_rankers
#         return @high_rankers
# end 

# def percent_high_ranking
#     rawnumber = (@high_rankers.count).to_f / (@cards.count).to_f
#     percent = (rawnumber*100).round(2)
#     return percent
# end 

def remove_card
        @cards.shift
end 

def add_card(card) 
    @cards = @cards.append(card)
    return @cards 
end 

end 