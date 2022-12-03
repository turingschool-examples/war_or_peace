class Start 
    attr_reader :player1,
                :player2

def initialize(player1, player2)
    @player1 = player1 
    @player2 = player2
    @turn = Turn.new(@player1, player2) 
end 

def start 
    @number = 0
    until @player1.has_lost? || @player2.has_lost? || @number == 1_000_000
        @turn.type 
        winnerofturn = @turn.winner 
        @turn.pile_cards
        @turn.award_spoils(winnerofturn)
        @number += 1
            if @turn.cardtype == :basic
                puts "Type of Turn: BASIC"
            elsif @turn.cardtype == :war
                puts "Type of Turn:War"
            elsif @turn.cardtype == :mutually_assured_destruction
                puts "Type of Turn: MAD"
            end 
        puts "BREAK"
        puts "NEXT TURN IS BELOW"
        puts ""
        puts ""
        puts ""
        
        puts "Turn number #{@number}
        player 1 cards: #{@player1.deck.cards.count}
        player 2 cards: #{@player2.deck.cards.count}"
        end 

        if @player1.has_lost?
            p "Sorry #{@player1.name} you have lost this game. Aun su amor para ti nunca mas sea para infinito, #{@player2.name} todavia te ama demasciadio."
        elsif @player2.has_lost? 
            p "Sorry #{@player2.name} you have lost this game. Aun su amor para ti nunca mas sea para infinito, #{@player1.name} todavia te ama demasciadio."
        elsif @number == 1_000_000
            p "This game will end with a draw."
        end 


end 
end 

