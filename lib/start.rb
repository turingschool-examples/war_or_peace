class Start 
    attr_reader :player1,
                :player2,
                :turn
def initialize(player1, player2)
    @player1 = player1 
    @player2 = player2
    @turn = Turn.new(@player1, @player2) 
end 

def start 
    number = 0
    1000.times do

        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        number += 1

            if turn.type == :basic
                puts "BASIC"
            elsif turn.type == :war
                puts "War"
            elsif turn.type == :mutually_assured_destruction
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

