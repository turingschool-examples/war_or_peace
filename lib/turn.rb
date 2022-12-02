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
        elsif @type == :war
            if (@player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2))
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
            @spoils_of_war << player1.deck.remove_card
            @spoils_of_war << player2.deck.remove_card
        elsif type == :war
            3.times do
                @spoils_of_war << player1.deck.remove_card
                @spoils_of_war << player2.deck.remove_card
            end
        else 
            3.times do
                player1.deck.remove_card
                player2.deck.remove_card
            end
        end
    end

    def award_spoils(winner)
        if @spoils_of_war.count && winner == player1
            2.times do
                @player1.deck.cards << spoils_of_war.shift
            end
        elsif @spoils_of_war.count == 2 && winner != player1
            2.times do
                   @player2.deck.cards << spoils_of_war.shift
            end
        elsif @spoils_of_war.count == 6 && winner == player1
            6.times do
                @player1.deck.cards << spoils_of_war.shift
            end
        elsif @spoils_of_war.count == 6 && winner != player1
            6.times do
                @player2.deck.cards << spoils_of_war.shift
            end
        
        end
    end
end