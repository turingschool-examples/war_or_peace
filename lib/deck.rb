require './lib/card'

class Deck
    attr_reader :name, :cards, :high_ranking_cards
    def initialize(cards = [])
        @cards = cards
    end

    def add_card(card)
        @cards << card
    end

    def rank_of_card_at(card_position)
        @cards[card_position].rank
    end

    def high_ranking_cards
        high_cards = []
        @cards.each do |card|
            high_cards << card if card.rank >= 11
        end
        high_cards
    end

    def percent_high_ranking
        (high_ranking_cards.count.to_f / cards.count * 100).round(2)
    end

    def remove_card
        cards.shift
    end
end 