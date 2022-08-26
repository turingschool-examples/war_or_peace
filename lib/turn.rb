require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'



class Turn
    attr_reader :player1, :player2, :spoils_of_war
    
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        
    end
    
    def type
        if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
            return :basic
        
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
            return :war
        elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
            return :mutually_assured_destruction
        end
    end      
    
    def winner
        if type == :basic
            if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
                @player1
            elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
                @player2
            end    
        elsif type == :war
            if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
                @player1
            elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
                @player2
            end
        elsif type == :mutually_assured_destruction
            "No Winner"
        end 
    end       

    def pile_cards
        if type == :basic
            @spoils_of_war << @player1.deck.cards.shift
            @spoils_of_war << @player2.deck.cards.shift
        elsif type == :war
            @spoils_of_war << @player1.deck.cards.shift(3)
            @spoils_of_war << @player2.deck.cards.shift(3)
            @spoils_of_war = @spoils_of_war
        elsif type == :mutually_assured_destruction
            @player1.deck.cards.shift(3)
            @player2.deck.cards.shift(3)
        
        
        end
    end    

    def award_spoils(winner)
        spoils_of_war.each do | spoils |
            winner.deck.cards.push(spoils)
        end

    end

end     



