class Turn
    attr_reader :player1,
                :player2,
                :spoils_of_war
                :winner 
               #  :no_winner

    def initialize(player1, player2)
         @player1 = player1 
         @player2 = player2
         @spoils_of_war = []
         @winner = winner
    end

    def type 
     if @player1.deck.cards.count == 0 
          # break
     elsif @player2.deck.cards.count == 0 
          # break
     elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
                    :basic
     elsif (@player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3) && (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2))
                    :normal_war 
     elsif (@player1.deck.cards.count < 3 && @player2.deck.cards.count >= 3) && (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(-1) != @player2.deck.rank_of_card_at(2))
                    :p1lowcardswar
     elsif (@player2.deck.cards.count < 3 && @player1.deck.cards.count >= 3) && (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player2.deck.rank_of_card_at(-1) != @player1.deck.rank_of_card_at(2))
                    :p2lowcardswar
     elsif (@player2.deck.cards.count < 3 && @player1.deck.cards.count < 3) && (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player2.deck.rank_of_card_at(-1) != @player1.deck.rank_of_card_at(-1))
                    :bothplowcardwar
     elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
                    :mutually_assured_destruction
       end
    end

    def winner
        if type == :basic 
               if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
                    winner = @player1
               elsif @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
                    winner = @player2
               end
          elsif type == :normal_war  
               if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
                    winner = @player1
               elsif @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
                    winner = @player2
               end
          elsif type == :p1lowcardswar
               if @player1.deck.rank_of_card_at(-1) > @player2.deck.rank_of_card_at(2)
                    winner = @player1
               elsif @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(-1)
                    winner = @player2                         
               end
          elsif type == :p2lowcardswar
               if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(-1)
                    winner = @player1
               elsif @player2.deck.rank_of_card_at(-1) > @player1.deck.rank_of_card_at(2)
                    winner = @player2
               end 
          elsif type == :bothplowcardwar
               if @player1.deck.rank_of_card_at(-1) > @player2.deck.rank_of_card_at(-1)
                    winner = @player1
               elsif @player2.deck.rank_of_card_at(-1) > @player1.deck.rank_of_card_at(-1)
                    winner = @player2
               end 
          elsif type == :mutually_assured_destruction
               winner = nil
        end 
     end 

    def pile_cards
          if type == :basic
               @spoils_of_war << @player1.deck.remove_card 
               @spoils_of_war << @player2.deck.remove_card 

          else
               3.times do 
                    @spoils_of_war <<  @player1.deck.remove_card 
                    @spoils_of_war << @player2.deck.remove_card 
               end 
          end 
          

     end


    def award_spoils(winner)
     
     if winner == @player1
          @spoils_of_war.each do |spoil|
          @player1.deck.cards << spoil 
          end 
          
     elsif winner == @player2
          @spoils_of_war.each do |spoil|
          @player2.deck.cards << spoil 
          end  

     elsif type == :mutually_assured_destruction    
          @spoils_of_war.clear
          
     end
     @spoils_of_war.clear 
    end

end