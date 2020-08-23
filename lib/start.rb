class Start
  attr_reader :turn
  def initialize(turn)
    @turn = turn

  end


  def start
    counter = 0
    until player1.has_lost? == true || player2.has_lost? == true do
      @turn
      counter += 1
      if @turn.type == :basic
        puts "Turn #{counter}: #{@turn.winner.name} won 2 cards"
      elsif @turn.type == :war
        puts "Turn #{counter}: WAR - #{@turn.winner.name} won 6 cards"
      elsif @turn.type == :mutually_assured_destruction
        puts "Turn #{counter}: *mutually_assured_destruction* 6 cards removed from play"
      elsif @turn.player1.deck == []
        puts "*~*~*~* #{@player2} has won the game! *~*~*~*"
      elsif @turn.player2.deck == []
        puts "*~*~*~* #{@player1} has won the game! *~*~*~*"
      elsif counter == 1000000
        "---- DRAW ---"
      else
        puts "Uh oh! Something went wrong! Let's try again"
      end
    end
  end
end
#player.has_lost?
#@turn.player1.deck != [] || @turn.player2.deck != [] do
