class Deck
    attr_reader :cards
    def initialize(cards = [])
        @cards = cards
    end

    def rank_of_card_at(rank)
        cards[rank].rank
    end
end