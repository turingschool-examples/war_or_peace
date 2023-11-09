class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index)
        # @cards arr.find_index(index)
        # @cards = arr.fetch(index)
        # arrayIndex = array.find_index { |index| item[rank] == index}
        # rank_of_card = @cards[index]
        @cards.each do |rank|
            
        end
    end
    
    def high_ranking_cards
    end

    def remove_card
    end

    def add_card
    end

    
end
