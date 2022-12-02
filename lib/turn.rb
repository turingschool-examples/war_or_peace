class Turn
    attr_reader :player1,
                :player2,
                :spoils_of_war
                :winner 

    def initialize(player1, player2)
         @player1 = player1 
         @player2 = player2
         @spoils_of_war = []
         @winner = winner

    end

    def type 
       if  @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            :basic
       elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
            :war 
       else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
       end
    end

    def winner
        if type == :basic 
          winner = nil 
               if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
                    winner = @player1
               else @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
                    winner = @player2
               end
        elsif type == :war     
               if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
                    winner = @player1
               else @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
                    winner = @player2
               end
          elsif type == :mutually_assured_destruction
               winner = "No Winner"
               nil 
        end 
        return winner
     end 

    def pile_cards
          if type == :basic
               @spoils_of_war << @player1.deck.remove_card 
               @spoils_of_war << @player2.deck.remove_card 

          elsif type == :war 
               3.times do 
                    @spoils_of_war <<  @player1.deck.remove_card 
                    @spoils_of_war << @player2.deck.remove_card 
               end 

          elsif type == :mutually_assured_destruction
               3.times do 
                    @player1.deck.remove_card 
                    @player2.deck.remove_card 
               end 
          end
    end
    @spoils_of_war

    def award_spoils(winner)
     if winner == @player1
          @player1.deck.cards << @spoils_of_war 
     elsif winner == @player2
          @player2.deck.cards << @spoils_of_war 
     end
    end

    def start 

    end
end