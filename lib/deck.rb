# 'Test Set 1'
class Deck

    attr_reader :cards_arr
    def initialize(cards_arr)
        @cards_arr = cards_arr
        @high_ranking_cards = []
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
# 'Test Set 4'
    def high_ranking_cards
        @cards_arr.each do |card|
            if card.rank >= 11
                @high_ranking_cards << card
            end
        end
        @high_ranking_cards
    end

    def percent_high_ranking
        rank = []
        highs = 0
        lows = 0
        @cards_arr.each do |card|
            rank << card.rank
        end

        rank.each do |i|
            if i >= 11
                highs += 1
            else
                lows += 1
            end
        end
        
        divisor = @cards_arr.count
        percent_high_ranking = (highs.to_f / divisor.to_f) * 100
        percent_high_ranking.round(2)
    end
end
