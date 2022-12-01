class Deck

    attr_reader :cards_arr

    def initialize (cards_arr)
        @cards = cards_arr
        # require 'pry'; binding.pry
    end

    def rank_of_card_at(index)
        # require 'pry'; binding.pry
        @cards[index].rank
    end
end