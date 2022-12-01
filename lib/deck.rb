class Deck
    attr_reader :cards, :high_ranking
    
    def initialize(cards = [])
        @cards = cards
        @high_ranking = []
    end

    def rank_of_card_at(index)
       @cards[index].rank
    end

    def high_ranking_cards
        @cards.each do |card|
            if card.rank >= 11
                @high_ranking << card
            end
            
        end
        @high_ranking
    end

    def percent_high_ranking
        high_cards = (high_ranking_cards.length)
        total_cards = (@cards.length)

        ((high_cards.to_f/total_cards.to_f) * 100).round(2)
    end
end