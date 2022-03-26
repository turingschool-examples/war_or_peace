require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
    attr_reader :player1, :player2, :spoils_of_war
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
       return :basic if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0) 
       return :war if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
       return :mutually_assured_destruction if :war == true && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at  
    end

    def winner
        if type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                player1
            else
                player2
            end
        elsif type == :war
            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                player1
            else
                player2
            end
        else
             "No Winner"
        end  
    end
    
    def pile_cards
        if type == :basic
            @spoils_of_war << player1.deck.cards.shift
            @spoils_of_war << player2.deck.cards.shift
        elsif type == :war
            3.times do
                @spoils_of_war << player1.deck.cards.shift
            end
            3.times do
                @spoils_of_war << player2.deck.cards.shift
            end
        else
            3.times do
                player1.deck.cards.shift
            end
            3.times do 
                player2.deck.cards.shift
            end
        end
    end

    def award_spoils(winner)
        if winner == player1
            player1.deck.cards.concat(spoils_of_war)
        else
            player2.deck.cards.concat(spoils_of_war)
        end
    end
end