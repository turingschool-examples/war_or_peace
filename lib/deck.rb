class Deck
   attr_reader :cards

   def initialize(cards)
     @cards = cards
   end

   def rank_of_card_at(index)
     @cards[index].rank
   end

    def high_ranking_cards
      @cards.find_all do |card|
        card.rank > 10
        end
     end
        # High Ranking cards method using .each
        # high_ranking = []
        # @cards.each do |card|
        #   if card.rank > 10
        #     high_ranking << card
        #   end
        #
        # end
        # high_ranking
        # end

   def percent_high_ranking
     (100*high_ranking_cards.length.to_f / @cards.length.to_f).round(2)
   end

   # def remove_card
   #   remove top card from deck  #define this function
   # end
   #
   # def add_card
   #   add_card top card from deck  #define this function
   # end

 end
