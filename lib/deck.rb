class Deck
    attr_reader :cards, :high_ranking_cards

    def initialize(cards)
        @cards = cards
        @high_ranking_cards = []
    end

    def rank_of_card_at(index)
        cards[index].rank
    end

    def high_ranking_cards
        high_ranking_cards = []
        cards.each do |card|
            high_ranking_cards << card if card.rank >= 11
        end
        high_ranking_cards
    end

    def percent_high_ranking
        ((high_ranking_cards.size) * 100 / cards.size.to_f).round(2)
    end

    def remove_card
        cards.shift
    end

    def add_card(new_card)
        cards.push(new_card)
    end

end