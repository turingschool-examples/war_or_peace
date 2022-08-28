class Game
  attr_reader :start, :turn_count, :status  
  attr_accessor :turn 
  def initialize(turn)
    @turn = turn 
    @turn_count = 0
    @status = false  
  end 

  def start 
    
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Megan and Aurora.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
    input = gets.chomp 
    if input == 'GO'
      
      turn.print_deck
      

      until @turn_count > 1000000 || turn.player1.deck.cards.count==0 || turn.player2.deck.cards.count==0
     
        puts "Turn #{@turn_count}:"
        if turn.type == :autowin1
          puts "player1 wins"
        elsif turn.type == :autowin2
          puts "player2 wins"
        else
        
          turn.print_deck
          @turn_count += 1 
          winner = turn.winner
          turn.turn_results 
          turn.pile_cards
          turn.award_spoils(winner)
        end 
      end 

      if @turn_count > 1000000
        puts "---- DRAW ----"
      elsif turn.player1.deck.cards.count==0 
        puts "*~*~* #{turn.player2.name} has won the game! *~*~*"
      elsif turn.player2.deck.cards.count==0 
        puts "*~*~* #{turn.player1.name} has won the game! *~*~*"
      end
    else
      puts 'Try again, type "GO"' 
    end 
  end 
end 
