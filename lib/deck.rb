class Deck
    attr_reader :cards

    def initialize(cards)
        #LITTLE RUBY MAN# cards = [card1, card2, card3]
        @cards = cards
    end
    
    def rank_of_card_at(index)
        @cards[index].rank
    end

    def high_ranking_cards
        high_rankers = []
        
        @cards.each do |card|
          if card.rank >= 11
            high_rankers << card
          end
        end
       
        high_rankers
    end

    def percent_high_ranking
        ((high_ranking_cards.count.to_f / cards.count) * 100).round(2)
    end

    def remove_card
        @cards.shift
    end

    def add_card(new_card)
        @cards << new_card
    end


end
