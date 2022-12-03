class Start 
    attr_reader :player1,
                :player2

def initialize(player1, player2)
    @player1 = player1 
    @player2 = player2
    @turn = Turn.new(@player1, player2) 
    # require 'pry'; binding.pry
end 

def start 
    number = 0
    1000.times do

        @turn.type 
        # require 'pry'; binding.pry
        winnerofturn = @turn.winner 
        @turn.pile_cards
        @turn.award_spoils(winnerofturn)
        number += 1

            if @turn.cardtype == :basic
                puts "BASIC"
            elsif @turn.cardtype == :war
                puts "War"
            elsif @turn.cardtype == :mutually_assured_destruction
                puts "MAD"
            end 

        puts "BREAK"
        puts "NEXT TURN IS BELOW"
        puts ""
        puts ""
        puts ""
        puts ""

        puts "Turn number #{number}
        player 1 cards: #{@player1.deck.cards.count}
        player 2 cards: #{@player2.deck.cards.count}"
        end 



end 
end 

