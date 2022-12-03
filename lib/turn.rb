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
          if @player1.deck.cards.count < 3 || @player2.deck.cards.count < 3
               return :basic

          elsif (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
               return :mutually_assured_destruction

          elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
               return :war 

          else
          # if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
               return :basic

          end
    end

    def winner
        if type == :basic 
               if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
                    return @player1
               else
                    return @player2
               end
               
          elsif type == :war  
               if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
                    return @player1
               else
                    return @player2
               end

          elsif type == :mutually_assured_destruction
               winner = "No Winner"
        end 
     end 

    def pile_cards
          if type == :basic
               @spoils_of_war << @player1.deck.remove_card 
               @spoils_of_war << @player2.deck.remove_card 
              

          elsif type == :mutually_assured_destruction 
               (@player1.deck.cards).replace(@player1.deck.cards.drop(3))
               (@player2.deck.cards).replace(@player2.deck.cards.drop(3))

          elsif type == :war 
               3.times do 
               @spoils_of_war << @player1.deck.remove_card 
               @spoils_of_war << @player2.deck.remove_card 
               
               end 
               
          end 
     end

    def award_spoils(winner)
     if type == :mutually_assured_destruction
               "do nothing"
     elsif type == :basic || :war 
          (winner.deck.cards).concat(@spoils_of_war)
          @spoils_of_war.clear
     end
     end 
end