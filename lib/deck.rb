class Deck
    
    #Allows us to read these attributes outside of the class.
    #These are also methods which allows them to be called on objects.
    attr_reader :cards,
                :rank,
                :position
                :high_ranking_cards

    #Initialize variables      
    def initialize(cards)
        @cards = cards
        @high_ranking_cards = []
    end

    #Define methods

    #Returns the rank of the card at the 
    #deck position passed in the argument
    def rank_of_card_at(position)
        @cards[position].rank
    end   

    #Places high ranking cards from the cards array into an 
    #array called high_ranking_cards
    def high_ranking_cards
        @cards.each do |card|          
            if card.rank >= 11  
            @high_ranking_cards << card  
            end
        end
        return @high_ranking_cards
    end  

    #Determines percent of high ranking cards in the deck
    def percent_high_ranking
        high_rank_card_counter = 0
            @cards.each do |card| 
                if card.rank >= 11
                    high_rank_card_counter += 1
                end
            end 
        float = high_rank_card_counter*100.00/3.00 
        return float.round(2)  
    end  

    #Removes and returns top card of the deck 
    #and modified deck array
    def remove_card
        @cards.shift
    end


    #Adds a card to the bottom of the deck
    def add_card(card)
        @cards<<cards
    end  
end