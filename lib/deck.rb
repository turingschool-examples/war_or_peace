class Deck
    
    attr_reader :cards, :high_cards

    def initialize(cards)
        @cards = cards
        @high_cards = []
    end

    def rank_of_card_at(index)
        @cards[index].rank
    end


    def high_ranking_cards
        
        cards.map do |card|
            if card.rank >= 11
                high_cards << card
            end
        end
        high_cards
    end

    def percent_high_ranking
        high_ranking_cards
        decimal = (high_cards.length.to_f / cards.length.to_f) * 100
        
        decimal.round(2)
    end

    def remove_card
        cards.shift
    end

    def add_card(card)
        cards.push(card)
    end
end