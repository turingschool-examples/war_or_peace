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
          if(@turn.winner != 'No Winner')
            @turn.award_spoils(@turn.winner)
            p "Turn #{turn_count}: #{@turn.winner.name} won #{@turn.spoils_of_war.length} cards"
          end
        elsif(@turn.type == :war)
          @turn.pile_cards
          if(@turn.winner != 'No Winner')
            @turn.award_spoils(@turn.winner)
            p "Turn #{turn_count}: WAR - #{@turn.winner.name} won #{@turn.spoils_of_war.length} cards"
          end
        elsif(@turn.type == :sudden_death)
          @turn.pile_cards
          p "*~*~*~* #{@turn.winner.name} has won the game *~*~*~*"
          break
        else
          @turn.pile_cards
          p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
        end
      end
    end
    if(@turn.type != :sudden_death)
      if(turn_count == 1_000_000)
        p "----- Draw -----"
      end
    end
  end
end
