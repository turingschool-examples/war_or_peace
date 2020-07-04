require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

class Game
attr_reader :player1, :player2, :turn, :starter, :deck1, :deck2

  def initialize(turn_param)
    @turn = turn_param
  end
  
  def start
    until @starter == "GO"
      p "Type 'GO' to start the game!"
      p "--------------------------------------------------------------------"
      p ">"
      @starter = gets.chomp.upcase
    end
  end


end
