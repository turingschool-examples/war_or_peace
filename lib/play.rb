class Play
  def initialize(turn)
    @turn = turn
  end

  def start
    game_over = false
    turn_count = 0
    until(game_over || turn_count == 1_000_000) do
      turn_count += 1
      if(!@turn.player1.has_lost? || !@turn.player2.has_lost?)
        if(@turn.type == :basic)
          @turn.pile_cards
          @turn.award_spoils(@turn.winner)
          p "Turn #{turn_count}: #{@turn.winner.name} won #{@turn.spoils_of_war.length} cards"
        elsif(@turn.type == :war)
          @turn.pile_cards
          @turn.award_spoils(@turn.winner)
          p "Turn #{turn_count}: WAR - #{@turn.winner.name} won #{@turn.spoils_of_war.length} cards"
        else
          @turn.pile_cards
          p "Turn #{turn_count}: *mutually assured destruction* #{@turn.spoils_of_war.length} cards removed from play"
        end
      end
    end
    if(turn_count == 1_000_000)
      p "----- Draw -----"
    end
  end
end
