class Turn
    attr_reader :player1,
                :player2,
                :spoils_of_war

    def initialize(player1, player2)
         @player1 = player1 
         @player2 = player2
         @spoils_of_war = []

    end

    def type 
       if  @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            :basic
       elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            :war 
       else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
       end
    end

    def winner
        if :basic 
               if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
                    @player1.name
               else @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
                    @player2.name
                    
               end
        elsif :war     
               if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
                    @player1.name
               else @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
                    @player2.name
               end
        else :mutually_assured_destruction
          "No Winner"
        end
     end 

    def pile_cards
          if :basic
               @player1.deck.remove_card
               spoils_of_war << @player1.deck.deleted_card
               @player2.deck.remove_card
               spoils_of_war << @player2.deck.deleted_card
               require 'pry'; binding.pry
          elsif :war 
               @player1.deck.remove_card
               spoils_of_war << @player1.deck.deleted_card
               @player2.deck.remove_card
               spoils_of_war << @player2.deck.deleted_card
               require 'pry'; binding.pry

          else :mutually_assured_destruction

          end
    end

    def award_spoils

    end
end