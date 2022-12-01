require './lib/card'

class Deck
    attr_reader :name, :cards, :high_ranking_cards
    def initialize(name)
        @name = name
        @cards = []
        @high_ranking_cards = []
    end

    def add_card(card)
        @cards << card
    end

    def rank_of_card_at(card_position)
        @cards[card_position].rank
    end

    def high_ranking_cards
        # @cards.each do |card|
        #     if card.rank >= 11
        #     @high_ranking_cards << card
        #     end
        # end
    end

    def percent_high_ranking
        
    end

    def remove_card
        cards.shift
    end
end 