class Play
  def initialize(turn)
    @turn = turn
  end

  def start
    game_over = false
    turn_count = 0
    until(game_over || turn_count == 1_000_000) do
      turn_count += 1
      if(turn.player1.has_lost? || turn.player2.has_lost?)
        game_over = true
      end
      if(turn.type == :basic)
        p "Turn #{turn_count}: #{turn.winner} won #{turn.spoils_of_war.lenght} cards"
      elsif(turn.type == :war)
        p "Turn #{turn_count}: WAR - #{turn.winner} won #{turn.spoils_of_war.lenght} cards"
      else
        p "Turn #{turn_count}: *mutually assured destruction* #{turn.winner} won #{turn.spoils_of_war.lenght} cards"
      end
    end
  end
end
