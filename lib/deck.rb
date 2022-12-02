class Deck
    attr_reader :cards

    def initialize(cards)
        # cards = [card1, card2, card3]
        @cards = cards
    end
    
    def rank_of_card_at(index)
        @cards[index].rank
    end

    def high_ranking_cards
       high_ranking_pile = []
        
        @cards.each do |card|
          if card.rank >= 11
            high_ranking_pile << card
          end
        end
       
        high_ranking_pile
    end

    def percent_high_ranking
        ((high_ranking_cards.count.to_f / cards.count) * 100).round(2)
    end

    def remove_card
        @cards.shift
    end



end
