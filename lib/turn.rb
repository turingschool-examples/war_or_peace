require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
    attr_reader :player1, :player2, :spoils_of_war
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
        @type = type
    end

    def type
       return :basic if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) 
       return :war if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
       return :mutually_assured_destruction if :war == true && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at  
    end

    def winner
        if @type = :basic
            if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
                @player1
            else
                @player2
            end
        end   
    end       

end