class Deck
    attr_reader :cards

    def initialize(cards = [])
        @cards = cards
    end

    def rank_of_card_at(index)
        cards[index].rank
    end

    def high_ranking_cards
        face_cards = []
        cards.each do |card|
            if card.rank > 10
                face_cards << card
            end
        end
        face_cards
    end

    def percent_high_ranking
        (high_ranking_cards.length.to_f / cards.length.to_f*100).round(2)
    end

    def remove_card
        cards.shift
    end

    def add_card(card)
        # cards.insert(-1,card)
        @cards << card
    end
end