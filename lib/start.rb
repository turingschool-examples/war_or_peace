class Start 
    attr_reader :player1,
                :player2,
                :turn

def initialize
    cards = CardGenerator.new(File.read('./lib/cards.txt')).create_cards
    # cards variable becomes the result of the CardGenerator calculations
    p1deck = Deck.new(cards[0..25])
    p2deck = Deck.new(cards[26..52])
    player1 = Player.new("Hady", p1deck)
    player2 = Player.new("Maria Magdalena", p2deck)
    @player1 = player1
    @player2 = player2
    @turn = Turn.new(player1, player2) 
end 

def say_go
    puts "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are #{@player1.name} and #{@player2.name}."
    puts "Type GO to start the game!"
    puts "-----------------------------------------------------------"
    
    saygo = gets.chomp 
    
    if saygo == "GO"      
        self.start
    end 
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
#  I put the rank notes because I was running into issues of loops and I wanted to make sure that the same cards were not being cycles continuously.
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

