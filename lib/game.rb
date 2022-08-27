class Game
  attr_reader :start
  def initialize()
    # @start = start 
  end 

  def start 
    
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Megan and Aurora.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
    input = gets.chomp 
    if input == 'GO'
      turn.type
      turn.pile_cards
      turn.winner
      turn.award_spoils
      #turn happens
      # turn_count += 1
    else
      puts 'Try again, type "GO"' 
    end 
  end 
end 
# game1 = Game.new()
# game1.start 
#turn.type 