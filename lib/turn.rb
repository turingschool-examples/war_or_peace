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
        @spoils_of_war = []
        
    end

    def type
        
        if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            :basic
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) 

            if not_enough_cards? == FALSE

                if @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
                :war
                else
                :mutually_assured_destruction
                end

            else

                :war
                
            end
            

        end
    end

    def winner


        if type == :basic

                
            if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
            @player1
            else
            @player2
            end

        elsif type == :war
            
            if not_enough_cards? == FALSE

                if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
                @player1
                else
                @player2
                end

            else

            not_enough_cards

            end

        end

    end


    def not_enough_cards?

        if @player1.deck.cards.length < 3 
            TRUE
        elsif @player1.deck.cards.length < 3 
            TRUE
        elsif @player2.deck.cards.length < 3 
            TRUE
        elsif @player2.deck.cards.length < 3 
            TRUE
        else
            FALSE
        end

    end

    def not_enough_cards
        if @player1.deck.cards.length < 3
            @player2
        elsif @player2.deck.cards.length < 3
            @player1
        end
    end



    def pile_cards

        

        if type == :basic

        @spoils_of_war << @player1.deck.remove.card

        @spoils_of_war << @player2.deck.remove_card

        elsif type == :war
        
            3.times do
                @spoils_of_war << @player1.deck.remove_card
            end

            3.times do
                @spoils_of_war << @player2.deck.remove_card
            end

        elsif type == :mutually_assured_destruction

            3.times do
                @player1.deck.cards.shift
            end

            3.times do
                @player2.deck.cards.shift
            end

        end
        

    end

    def award_spoils

        if type != :mutually_assured_destruction

            

                if winner.deck.cards.empty? == FALSE

                    i = @spoils_of_war.length

                    i.times do
                    winner.deck.cards << @spoils_of_war.shift
                    end
                end
            
   
        end
    end
end



# type: a turn is :basic, :war, or :mutually_assured_destruction.
# A :basic turn is one in which the rank_of_card_at(0) from the players’ decks are not the same rank.
# A :war turn occurs when both players’ rank_of_card_at(0) are the same.
# :mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.