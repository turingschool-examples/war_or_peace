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
          winner = nil 
               if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
                    winner = @player1.name
               else @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
                    winner = @player2.name
               end
        elsif :war     
               if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
                    winner = @player1.name
               else @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
                    winner = @player2.name
               end
        else :mutually_assured_destruction
          "No Winner"
          nil 
        end
        return winner 
     end 

    def pile_cards
          if :basic

               @spoils_of_war << @player1.deck.remove_card 
               
               @spoils_of_war << @player2.deck.remove_card 

          
          # elsif :war 


          # else :mutually_assured_destruction

          # end
    end
    @spoils_of_war
end 

    def award_spoils(winner)
     if winner == @player1.name 
          @player1.deck.cards << @spoils_of_war 
     elsif winner == @player2.name 
          @player2.deck.cards << @spoils_of_war 
     end
    end
end