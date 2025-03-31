require './lib/card'

class Deck
    attr_reader :cards

    def initialize(card)
        @cards = card
        @face_cards = []
        #@cards << card
    end

    def add_card(card)
        @cards.unshift(card)
    end

    def rank_of_card_at(index)
        @cards[index].rank
    end

    def suit_of_card_at(index)
        @cards[index].suit
    end
    
    def value_of_card_at(index)
        @cards[index].value
    end

    def high_ranking_cards
        @face_cards = []
        face_cards = @cards.select { |card| card.rank >= 11 }
        if face_cards != []
            @face_cards = face_cards
            return true
        else
            return false
        end

    end

    def percent_high_ranking
        @face_cards = @cards.select { |card| card.rank >= 11 } 
        num_face = @face_cards.size
        num_card = @cards.size
        return (num_face.to_f / num_card * 100).round(2)
    end

    def remove_card
        @cards.pop  
        #return @cards.size
    end

end