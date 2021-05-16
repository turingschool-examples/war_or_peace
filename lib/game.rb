require './lib/turn'
require './lib/player'
require './lib/deck'

class Game
  attr_reader :start

  def initialize
    @start = start
    @turn = Turn.new(@player1, @player2)
  end

  def turns
    @turns = 0
  end

  def start
    p "START GAME"
    loop do
      @turns =+ 1
      @turn
      if @turn.type == :basic
        "basic"
      elsif @turn.type == :spoils_of_war
        "spoils of war"
      else
        "war"
      end
    end
  end
end
