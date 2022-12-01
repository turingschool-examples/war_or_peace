class Deck
    attr_reader :cards,
                :high_rank

    def initialize(cards)
        @cards = cards
        @high_rank = []
    end

    def rank_of_card_at(index)
        @cards[index].rank
    end

    def high_ranking_cards
        @cards.each do |card|
            if card.rank >= 11
                @high_rank << card
            end
        end
        @high_rank
    end

    def percent_high_ranking
        ((high_ranking_cards.count.to_f / @cards.count) * 100).round(2)
    end
end

