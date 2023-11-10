class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index)
        @cards[index].rank
    end
    
    def high_ranking_cards
        @high_ranking_cards = []
        @cards.find_all do |card|
            if card.rank >= 11      
                @high_ranking_cards << card
            end
        end
        @high_ranking_cards
    end

    def percent_high_ranking
       percent = (@high_ranking_cards.count.to_f / @cards.count.to_f) * 100
       formatted_percent = "%.2f" % percent
    end

    def remove_card
        @cards.shift
    end

    def add_card(new_card)
        @cards << new_card
    end
end

