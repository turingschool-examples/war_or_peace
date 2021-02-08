class Deck
    attr_reader :cards 
    def initialize(cards)
        @cards = cards
    end

    def rank_of_cards_at(index)
        p cards[index].rank
    end

    def high_ranking_cards
        high_cards = cards.each_with_index.map do |card, index|
            if card.rank >= 11
                cards[index]
            end
        end 
        return high_cards.compact
    end

    def percent_high_ranking
        p (100 * self.high_ranking_cards.length.to_f / cards.length).round(2)
    end

    def remove_card
        cards.pop
    end
    
    def add_card(card)
        cards << card
    end
end
