class Turn
    attr_reader :player1,
                :player2, 
                :cardtype
                
    def initialize(player1, player2)
         @player1 = player1 
         @player2 = player2
         @spoils_of_war = []
         @cardtype = nil 
    end

    def type
     cardtype = nil 
          if @player1.deck.cards.count < 3 || @player2.deck.cards.count < 3
               cardtype = :basic

          elsif (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
               cardtype = :mutually_assured_destruction

          elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
               cardtype = :war 

          else 
               cardtype = :basic
          end

          @cardtype = cardtype 
    end

    def winner
        if @cardtype == :basic 
               if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
                    return @player1
               else
                    return @player2
               end
               
          elsif @cardtype == :war  
               if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
                    return @player1
               else
                    return @player2
               end

          elsif @cardtype == :mutually_assured_destruction
                    winner = "No Winner"
        end 
     end 

    def pile_cards
          if @cardtype == :basic
               @spoils_of_war << @player1.deck.remove_card 
               @spoils_of_war << @player2.deck.remove_card 
          elsif @cardtype == :mutually_assured_destruction 
               (@player1.deck.cards).replace(@player1.deck.cards.drop(3))
               (@player2.deck.cards).replace(@player2.deck.cards.drop(3))
          elsif @cardtype == :war 
               3.times do 
               @spoils_of_war << @player1.deck.remove_card 
               @spoils_of_war << @player2.deck.remove_card 
               end 
          end 
     end 
     

    def award_spoils(winner)
          if @cardtype == :basic || @cardtype == :war
               (winner.deck.cards).concat(@spoils_of_war)
               (@player1.deck.cards).shuffle!
               (@player2.deck.cards).shuffle!
               @spoils_of_war.clear
          end 
     end 
end