require './lib/player'

class Turn

    attr_reader :player1, :player2, :spoils_of_war

    def initialize (player1, player2) #basic, war, mutually_assured_destruction)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
            :basic #This creates the symbol basic
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction #This creates the symbol mutually_assured_destruction
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            :war #this creates the symbol war
        end
    end

    def winner
        type = type() #this is necessary to establish type in this method
        if type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
            player1
        elsif type == :basic && player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
            player2
        elsif type == :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
            player1
        elsif type == :war && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
            player2
        elsif type == :mutually_assured_destruction 
            "No Winner"
        end
    end

    def pile_cards
        type = type() #this is necessary to establish type in this method
        if type == :basic 
            @spoils_of_war << player1.deck.remove_card && @spoils_of_war << player2.deck.remove_card
        elsif type == :war
            3.times {@spoils_of_war << player1.deck.remove_card && @spoils_of_war << player2.deck.remove_card}
        elsif type == :mutually_assured_destruction
            3.times {player1.deck.cards.shift} && 3.times {player1.deck.cards.shift}
        end
    end

    def award_spoils(winner)
        unless winner == 'No Winner'
          @spoils_of_war.each { |card| winner.deck.cards << card }
          @spoils_of_war = []
        end
    end




end