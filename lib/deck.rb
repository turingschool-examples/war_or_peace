class Deck

    attr_reader :cards

    def initialize(cards)
        @cards = cards
        # @high_cards = []
        # require 'pry'; binding.pry
    end

    def rank_of_card_at(index)
        # require 'pry'; binding.pry
        @cards[index].rank
    end

    def high_ranking_cards
        high_cards = []
        cards.each do |card|
            if card.rank >= 11 
                high_cards << card
                # require 'pry'; binding.pry
            end
        end
        high_cards
    end

    def percent_high_ranking
        # require 'pry'; binding.pry
        high_cards
        cards.length
        (2.to_f)/(3.to_f)

    end
end

