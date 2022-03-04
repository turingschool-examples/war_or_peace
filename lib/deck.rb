class Deck
    attr_reader :cards
    def initialize(cards)
      @cards = cards
    end

    def rank_of_card_at(index)
        @cards[index].rank
    end 

    def high_ranking_cards
        @cards.map do |card|
            card if card.rank >= 10  
        end.compact! 
    end
    
    def percent_high_ranking
        ((self.high_ranking_cards.length/@cards.length.to_f)*100).round(2)       
    end
    
    def remove_card
        @cards.delete(@cards[0])
    end 
end 