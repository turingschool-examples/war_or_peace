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
                    if card.rank >= 11 
                    face_cards << card
                    end
                end
               face_cards
     
          end
   
          def percent_high_ranking
               decimal = (high_ranking_cards.count.to_f / cards.count) * 100
               decimal.round(2)
          end

          def remove_card
               cards.shift
          end

          def add_card(card)
               cards.push(card)
           end
   
end

