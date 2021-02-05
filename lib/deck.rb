class Deck
   attr_reader :cards
   def initialize(cards)
     # @deck = deck
     @cards = cards
   end

   def rank_of_card_at(index)
     @cards[index].rank
     #How does this work?
     # @card = array
     # [0] = card1
     # .rank = 12
   end

    def high_ranking_cards
     if @rank >= 11    #### find the enumerable that returns this
       return_card
     end
    end
   #
   # def percent_high_ranking
   #   return high_ranking_cards / total_cards #define total cards
   # end
   #
   # def remove_card
   #   remove top card from deck  #define this function
   # end

 end
