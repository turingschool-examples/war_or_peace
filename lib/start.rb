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
    # while @player1.has_lost? == false && @player2.has_lost? == false
    10000.times do 
    number += 1
    @turn.winner
    @turn.pile_cards
    @turn.award_spoils(@turn.winner)

    if turn.type == :basic
        puts "BASIC"
    elsif turn.type == :war
        puts "War"
    elsif turn.type == :mutually_assured_destruction
        puts "MAD"
    end 

    if @player1.deck.cards.count == 0 || @player2.deck.cards.count == 0
         require 'pry'; binding.pry
        puts "test"
    end 

    puts "Turn number #{number}
     player 1 cards: #{@player1.deck.cards.count}
     player 2 cards: #{@player2.deck.cards.count}"
    
     if (@player1.deck.cards.count + @player2.deck.cards.count != 52) 
        puts "NUMBER NOT 52------------------------------------------------------"
    end 

    puts "BREAK"
    puts ""
    puts "NEXT TURN IS BELOW"
    puts ""
    
    if @player1.has_lost? == true
        puts "#{player1.name} loses"
        puts "#{player1.name} : #{@player1.deck.cards.count}. 
        #{player2.name} : #{@player2.deck.cards.count}"
    elsif @player2.has_lost? == true
        puts "#{player2.name} loses"
        puts "#{player1.name} : #{@player1.deck.cards.count}. 
        #{player2.name} : #{@player2.deck.cards.count}"
    end 
    end
end 


end 

