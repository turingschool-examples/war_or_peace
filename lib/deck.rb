class Deck
    attr_reader :cards, :high_ranking
    
    def initialize(cards = [])
        @cards = cards

    end

    def rank_of_card_at(index)
        @cards[index].rank
    end
end