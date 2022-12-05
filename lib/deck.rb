class Deck
        attr_reader :cards

    def initialize (cards)
        @cards = cards
    end

    def rank_of_card_at(index)
         @cards[index].rank
    end
    
    def high_ranking_cards 
        high_rank = []
        @cards.each do |card|
            if card.rank >= 11
                high_rank << card
            end
        end
        high_rank
    end

    def percent_high_ranking
        (((high_ranking_cards.count).to_f / cards.count) * 100).round(2)
    end

    def remove_card
        cards.shift
    end

    def add_card(cards)
        @cards << (cards)
    end
end