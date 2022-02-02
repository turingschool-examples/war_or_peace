class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index)
        return cards[index].rank
    end

    def high_ranking_cards()
        high_rank = []
        cards.each do |card|
            if card.rank >= 11
                high_rank << card
            end
        end
        return high_rank
    end

    def percent_high_ranking()
        high_rank = self.high_ranking_cards
        unrounded = high_rank.count / cards.count.to_f * 100
        return unrounded.round(2)
    end
end