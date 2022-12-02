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
    while (@player1.has_lost? == false && @player2.has_lost? == false)
    @turn.type
    @turn.winner
    @turn.pile_cards
    @turn.award_spoils(@turn.winner)
    number += 1
    puts "Turn number #{number}
     player 1 cards: #{@player1.deck.cards.count}
     player 2 cards: #{@player2.deck.cards.count}"
    if @player1.has_lost? == true
        puts "#{player1.name} loses"
        puts "#{number}"
        puts "#{player1.name} : #{@player1.deck.cards.count}. 
        #{player2.name} : #{@player2.deck.cards.count}"
    elsif @player2.has_lost? == true
        puts "#{player2.name} loses"
        puts "#{number}"
        puts "#{player1.name} : #{@player1.deck.cards.count}. 
        #{player2.name} : #{@player2.deck.cards.count}"
    end 
    end
end 


end 

