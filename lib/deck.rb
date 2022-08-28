require './lib/card'

class Deck
    attr_reader :cards, :rank
    
    def initialize(cards)
        @cards = cards

    end

    def rank_of_card_at(index)
        @cards[index].rank
    end
    
    def high_ranking_cards
        high_rank = []
        @cards.each do | card |
            if card.rank >= 11
                high_rank << card
            end    
        end
        return high_rank    
    end
    
    def percent_high_ranking
        return high_ranking_cards().length.to_f / @cards.length.to_f
    end

    def remove_card
        @cards.shift
    end

    def add_card(new)
        @cards << new
    end

    def cards 
        @cards
    end
end