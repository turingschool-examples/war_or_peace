require './lib/card'
require 'pry'

class Deck

    attr_reader :cards

    def initialize(cards)

        @cards = []
        @cards = cards
    
    end

    def rank_of_card_at(index)
        @cards[index].rank
    end

    def high_ranking_cards

        high_rank_cards = []

        @cards.each do |card|
            if card.rank >= 11
                high_rank_cards << card
            end
        end

        high_rank_cards

    end


    def percent_high_ranking

        
        numerator = high_ranking_cards.length() * 1.00

        denominator = @cards.length() * 1.00

        percent = numerator / denominator * 100

        percent.round(2)

    end

    def remove_card
        @cards.shift
    end

    def add_card(card)
        @cards << card
    end

end

