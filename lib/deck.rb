require 'pry'
require './lib/card'

class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index)
        @cards[index].rank
    end

    def high_ranking_cards
        high_rank_cards = [11, 'Jack', 'Queen', 'Ace', 'King']
        # high_cards = []
        # @cards.each do |card|
        #     if high_rank_cards.include?(card.value)
        #         high_cards << card
        #     end
        # end
        high_cards = @cards.select do |card|
            high_rank_cards.include?(card.value)
        end
        return high_cards
    end

    
    def percent_high_ranking
        percent = (high_ranking_cards.count.to_f / @cards.count.to_f).round(2) * 100
        # binding.pry
        return "#{percent.to_i}%"
    end

    def remove_card
        @cards.shift
    end

    def add_card(card)
        @cards << card
    end
end