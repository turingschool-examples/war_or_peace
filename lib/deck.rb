class Deck
    
    #Allows us to read these attributes outside of the class.
    #These are also methods which allows them to be called on objects.
    attr:cards,
        :rank,
        :position
        :high_ranking_cards
        :percent = percent

    #Initialize variables      
    def initialize(cards)
        @cards = cards
        @rank = rank
        @position = position 
    end

    def initialize
        @high_ranking_cards = []
        @percent = percent
    end

    #Define methods

    #Places cards into cards array
    def add_cards(cards)
        @cards<<cards
    end

    #Returns the rank of the card at the 
    #deck position passed in
    def rank_of_card_at(position)
        @cards[position].rank
    end   

    #Places high ranking cards from the cards array into an 
    #array called high_ranking_cards
    def high_ranking_cards
        @cards.each do |card| 
            if @card.rank >= 11 
            @high_ranking_cards << card
            end
        end
    end  

    #Determines the percent of high ranking cards
    #in the deck of cards
    def percent_high_ranking
        @cards.each do |card| 
            high_rank_count = 0
            if @card.rank >= 11
            high_rank_count += 1
            end
        end    
        percentage = count/3.0
    end  

    def remove_card()
        # cards.pop?
    end

    def add_card(cards)
        @cards<<cards
    end


    
end