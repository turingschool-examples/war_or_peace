class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index)
        if @cards.empty?
            puts 'You lose'
            return 'You lose'
        elsif @cards.length < 3
            @cards[0].rank 
        else
            @cards[index].rank 
        end 
    end 

    def high_ranking_cards
        @cards.select {|card| card.rank > 10}
    end
    
    def percent_high_ranking
        (self.high_ranking_cards.length/@cards.length.to_f*100).round(2)       
    end
    
    def remove_card
        @cards.delete_at(0)
    end  

    def add_card(card)
        @cards << card
    end
end 