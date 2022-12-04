class Deck
    attr_reader :cards
    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index)
        cards[index].rank
            # .length >=  
            # raiseArgumentError
            #if/end
    end

    def high_ranking_cards
        high_ranking_cards = cards.select do |card|
        card.rank >= 11
        end
        high_ranking_cards
    end

    def percent_high_ranking
        (high_ranking_cards.size.to_f / cards.size.to_f).round(4) * 100 
    end

    def remove_card
        cards.shift
    end

    def add_card(add_card)
        cards << add_card
    end
end