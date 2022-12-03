class Turn
    attr_reader :player1,
                :player2,
                :spoils_of_war
                # :type

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        # @type = :basic
    end

    def mutually_assured_destruction
        player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        
    end

    def war
        player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
        
    end

    def basic
        player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) || player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
        
    end

    def type
        if mutually_assured_destruction
          :mutually_assured_destruction
        elsif war
          :war
        else
          :basic
        end
    end

    def winner
        if type == :mutually_assured_destruction
            "No winner"
    
        elsif type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
            player1
            else player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
            player2
            end
            
    
        else type == :war
          if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
          player1
          else player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
          player2
          end
        end
      end
 
    def pile_cards
        if type == :mutually_assured_destruction
            player1.deck.remove_card
            player1.deck.remove_card
            player1.deck.remove_card

            player2.deck.remove_card
            player2.deck.remove_card
            player2.deck.remove_card

        elsif type == :basic
            @spoils_of_war << player1.deck.remove_card
            @spoils_of_war << player2.deck.remove_card

        else type == :war 
            3.times do |war| 
                war ==  @spoils_of_war << player1.deck.remove_card && player2.deck.remove_card
            # @spoils_of_war << player1.deck.remove_card
            # @spoils_of_war << player1.deck.remove_card
            # @spoils_of_war << player1.deck.remove_card
            # @spoils_of_war << player2.deck.remove_card
            # @spoils_of_war << player2.deck.remove_card
            # @spoils_of_war << player2.deck.remove_card
            end
        end
        
    end

    def award_spoils(winner)
        winner.deck.cards.concat(spoils_of_war)
        
    end


end
