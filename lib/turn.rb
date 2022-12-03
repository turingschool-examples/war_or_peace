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
               # require 'pry'; binding.pry

          elsif (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
               # require 'pry'; binding.pry
               return :mutually_assured_destruction

          elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
               # require 'pry'; binding.pry
               return :war 

          else 
               require 'pry'; binding.pry
               return :basic
               

          end
    end

    def winner
        if type == :basic 
          require 'pry'; binding.pry
               if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
                    return @player1
               else
                    return @player2
               end
               
          elsif type == :war  
               # require 'pry'; binding.pry
               if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
                    return @player1
               else
                    return @player2
               end

          elsif type == :mutually_assured_destruction
               # require 'pry'; binding.pry
               winner = "No Winner"
        end 
     end 

    def pile_cards
     # require 'pry'; binding.pry
          if type == :basic
               require 'pry'; binding.pry
               @spoils_of_war << @player1.deck.remove_card 
               @spoils_of_war << @player2.deck.remove_card 
          end 

          if  type == :mutually_assured_destruction 
               (@player1.deck.cards).replace(@player1.deck.cards.drop(3))
               (@player2.deck.cards).replace(@player2.deck.cards.drop(3))
               # require 'pry'; binding.pry
          end 

          if  type == :war 
               3.times do 
               @spoils_of_war << @player1.deck.remove_card 
               @spoils_of_war << @player2.deck.remove_card 
               require 'pry'; binding.pry
               end 
          end 
          end 
     

    def award_spoils(winner)
 
         if type == :mutually_assured_destruction
               # "do nothing"
               require 'pry'; binding.pry

     end 
     if type == :basic 
          require 'pry'; binding.pry
          (winner.deck.cards).concat(@spoils_of_war)
          @spoils_of_war.clear
     end 
     if type == :war 
          (winner.deck.cards).concat(@spoils_of_war)
          # require 'pry'; binding.pry
          @spoils_of_war.clear
          
     end
     end 
end