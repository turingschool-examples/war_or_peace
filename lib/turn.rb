require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Turn
    attr_reader :player1, 
                :player2, 
                :spoils_of_war, 
                :type
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        @type = type
    end

    def type 
        if (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)) 
            :mutual_destruction
        elsif (player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0))
            :basic 
        else 
            :war
        end
    end

    def winner
        if @type == :basic 
            if (@player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0))
                player1
            else player2
            end
        # elsif @type = :war
        #     if (@player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at())
        #         player1
        #     else player 2
        #     end
        end
    end

    def pile_cards
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
    end

    def award_spoils(winner)
        if turn.winner == player1
            @player1.deck << pile_cards
        else @player2.deck << pile_cards
        end
    end
end