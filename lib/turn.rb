class Turn
    attr_reader :player1, :player2, :spoils_of_war
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        
    end

    def type
      # I want to say: unless player1.deck == [] run the code below...
      
      if ( player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) ) &&
         ( player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2) )
        return :mutually_assured_destruction
      end

      if ( player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) ) &&
        ( player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2) )
        return :war
      end

      if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
        return :basic
      end
      
    end

    def winner
        if type == :basic && ( player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) )
            return player1
        else
            return player2
        end

        if type == :war && ( player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) )
          return player1
        else
          return player2
        end

        if type == :mutually_assured_destruction && ( player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2) )
          return player1

        end
    end
    
    def piles_cards
      if type == :basic 
        spoils_of_war << player1.deck.cards.shift
        spoils_of_war << player2.deck.cards.shift
        return spoils_of_war.flatten!
      end

      if type == :war 
        spoils_of_war << player1.deck.cards.shift(3)
        spoils_of_war << player2.deck.cards.shift(3)
        return spoils_of_war.flatten!
      end

      if type == :mutually_assured_destruction 
        player1.deck.cards.shift(3)
        player2.deck.cards.shift(3)
      end

    end

    def award_spoils(winner)
        winner.deck.cards << spoils_of_war
        winner.deck.cards.flatten!
    end
end