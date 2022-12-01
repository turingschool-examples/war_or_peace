class Deck
    
    attr_reader :cards, :high_cards

    def initialize(cards)
        @cards = [cards]
        @high_cards = []
    end

    def rank_of_card_at(index)
        @cards.index(rank)
    end



end