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
end