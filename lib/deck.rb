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
end