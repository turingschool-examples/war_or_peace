# deck of cards
require './lib/card.rb'

class Deck
    attr_reader :cards # :suit, :value, :rank
    def initialize(cards)
        @cards = []
    end

    def rank_of_card_at

    end

    def high_ranking_cards
        if rank > 10
            true
        end
    end

    def percent_high_ranking

    end

    def remove_card
        @cards.pop
    end

    def add_card(deck)
        @cards << deck
        
    end

end

