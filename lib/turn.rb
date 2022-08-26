require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

class Turn

    attr_reader :player1,
                :player2,
                :spoils_of_war
    
    def initialize(player1, player2)

        @player1 = player1
        @player2 = player2
        @spoils_of_war =[]
        
    end

    def type
        
        if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            :basic
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) 

            if @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
            :war
            else
            :mutually_assured_destruction
            end

        end
    end

    def winner

        nope = "No winner"

        players = [@player1, @player2]

        if type == :basic

            if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
            @player1
            else
            @player2
            end

        elsif type == :war

            if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
             @player1
            else
             @player2
            end

        else

        nope

        end

    end

end

# binding.pry

# type: a turn is :basic, :war, or :mutually_assured_destruction.
# A :basic turn is one in which the rank_of_card_at(0) from the players’ decks are not the same rank.
# A :war turn occurs when both players’ rank_of_card_at(0) are the same.
# :mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.