class Deck
    attr_reader :cards, :face_cards

    def initialize(cards = [])
        @cards = cards
        @face_cards = []
    end

    def rank_of_card_at(index)
        cards[index].rank
    end

    def high_ranking_cards
        cards.each do |card|
            if card.rank > 10
                face_cards << card
            end
        end
        face_cards
    end

    def percent_high_ranking
        (face_cards.length.to_f / cards.length.to_f)*100
    end

    def remove_card
        cards.shift
    end

    def add_card(card)
        cards.insert(-1,card)
    end
end