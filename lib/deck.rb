class Deck
    attr_reader :cards
    def initialize(cards = [])
        @cards = cards
    end

    def rank_of_card_at(card_rank)
        cards[card_rank].rank
    end

    def high_ranking_cards
        cards.select{ |high_rank| high_rank.rank > 10}.map{ |high_rank| high_rank }
    end

    def percent_high_ranking
        high_ranking_cards.length.to_f / cards.length * 100
    end

    def remove_card
        cards.shift
    end
end