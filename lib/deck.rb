class Deck
    attr_reader :cards
    def initialize(cards)
        #cards = [] ? ^
        @cards = cards

        

    end

    def rank_of_card_at(index)
        cards[index].rank
    end

    def high_ranking_cards
        highs = []

        cards.each do |card|
            if card.rank > 10
                highs << card
            end
        end

        highs
    end


    def percent_high_ranking
       ((high_ranking_cards.count.to_f / @cards.count.to_f) * 100).round(2)
    end

    def remove_card
        @cards.shift
    end

    def add_card(card)
        @cards << card
    end

end