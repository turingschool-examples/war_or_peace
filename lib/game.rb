require './lib/turn'


class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @round = 1
    @counter = 0
  end

  def counter
    counter.turns += 1
  end
  
  def start
    until @player1.haslost? == true || @player2.haslost? == true || turn.1000000 do
      start new turn
      turn

      @round += 1
    end
  end


  shuffled

end
