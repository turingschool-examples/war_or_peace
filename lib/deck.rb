require './lib/card'

class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(loc)
        return cards[loc].rank
    end

    def high_ranking_cards
        high_ranking_array = []

        cards.each do |card|
            if card.rank >= 11
                high_ranking_array << card
            end
        end

        return high_ranking_array
    end

    def percent_high_ranking
        total = 0.0
        div = cards.length.to_f

        cards.each do |card|
            if card.rank >= 11
                total += 1.0
            end
        end

        return (total/div * 100.00).round(2)
    end

    def remove_card
        cards.shift
    end

    def add_card(card)
        cards << card
    end

    def shuffle
        cards.replace(cards.sample(cards.size))
    end
end