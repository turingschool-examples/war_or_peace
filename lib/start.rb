class Start 
    attr_reader :player1,
                :player2,
                :turn
def initialize(player1, player2, turn)
    @player1 = player1 
    @player2 = player2
    @turn = turn 
end 
def start 
    number = 0
    14.times do 
    @turn.type
    @turn.winner
    @turn.pile_cards
    @turn.award_spoils(@turn.winner)
    require 'pry'; binding.pry
    number += 1
    if turn.type == :basic
        p "Turn #{number}: #{@turn.winner.name} won 2 cards."
    elsif turn.type == :war 
        p "Turn #{number}:WAR - #{@turn.winner.name} won 6 cards."
    elsif turn.type == :mutually_assured_destruction
        p "Turn #{number}: *mutually assured destruction* 6 cards removed from play"
    end 
    
end 

    puts "arab"
    
    
end

end 

