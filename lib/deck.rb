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
       @cards.each do |card|
            if card.rank >= 11
                @high_cards << card 
            end
        end
        @high_cards
    end

    def percent_high_ranking
        decimal = @high_cards.length / @cards.length.to_f
        (decimal * 100).round(2)
    end

    
end
