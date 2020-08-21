class Game
  attr_reader :player1, :player2, :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
  end

  def start
    game_loop
  end

  def game_loop
    until over?
      turn = Turn.new(player1, player2)
      @turn_count += 1
      #do turn stuff
    end
  end

  def over?
    player1.has_lost? || player2.has_lost? || turn_count == 100
  end

end
