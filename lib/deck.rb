# 'Test Set 1'
class Deck

    attr_reader :cards_arr
    def initialize(cards_arr)
        @cards_arr = cards_arr
    end
# 'Test Set 2'
    def rank_of_card_at(index)
        @cards_arr[index].rank
    end
# 'Test Set 3'
    def remove_card
        @cards_arr.shift
    end

    def add_card(card)
        @cards_arr << card
    end
end
