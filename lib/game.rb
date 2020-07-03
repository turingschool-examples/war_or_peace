require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

class Game
attr_reader :player1, :player2, :turn, :starter

  def initialize(turn_param)
    @turn = turn_param
  end

  def welcome
  until @starter == "GO"
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "the players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "--------------------------------------------------------------------"
    p ">"
    @starter = gets.chomp.upcase
    end
  end

end
