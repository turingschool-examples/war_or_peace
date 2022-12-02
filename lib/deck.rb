class Deck

    attr_reader :cards_arr, :high_cards

    def initialize (cards_arr)
        @cards = cards_arr
        @high_cards = []
        # require 'pry'; binding.pry
    end

    def rank_of_card_at(index)
        # require 'pry'; binding.pry
        @cards[index].rank
    end

    def high_ranking_cards
        # require 'pry'; binding.pry
        @cards.each do |card_arr|
            if card_arr.rank >= 11 
                @high_cards << card_arr
            end
        end
        @high_cards
    end
end

