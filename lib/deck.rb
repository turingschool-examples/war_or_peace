class Deck
   attr_reader :cards

   def initialize(cards)
     @cards = cards
   end

   def rank_of_card_at(card)
     @cards[card].rank
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
     (100*high_ranking_cards.length.fdiv(@cards.length)).round(2)
   end

   def remove_card
     @cards.shift
   end

   def add_card(card)
     #require "pry"; binding.pry
     @cards.push(card)
     #remove_card.push(card)
   end

 end
