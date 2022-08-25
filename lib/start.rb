

# start method - while no one has lost continue the turn...
# print specific lines based on what kind of turn
# if no player has all cards after 1,000,000 turns, the result of the game is a draw


class Game
  def initialize(player1, player2, turn)
    @player1 = player1
    @player2 = player2
    @turn = turn
  end

  def start
    turn = 0

    until @player1.has_lost? == true || @player2.has_lost? == true
      turn += 1
      binding.pry
      if @turn.type == :mutually_assured_destruction
        p "TURN #{turn}: *mutually assured destruction* 6 cards removed from play"
      elsif @turn.type == :war
        p "TURN #{turn}: WAR - #{@turn.winner.name} won 6 cards"
        @turn.pile_cards
        @turn.award_spoils(@turn.winner)
      else
        p "TURN #{turn}: #{@turn.winner.name} won 2 cards"
        @turn.pile_cards
        @turn.award_spoils(@turn.winner)
      end

      if turn == 10_000
        p '---- DRAW ----'
        break
      end
    end
  end
end

    # if @player1.has_lost? == true
    #   p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    # elsif @player2.has_lost? == true
    #   p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    # elsif @turn.type == :mutually_assured_destruction
    #   p '*mutually assured destruction* 6 cards removed from play'
    # elsif turn == 10_000
    #   p '---- DRAW ----'
    # else
    #   turn += 1
    #   @turn.type
    #   winner = @turn.winner
    #   @turn.pile_cards
    #   @turn.spoils_of_war
    #   p "Turn #{turn}: #{@turn.winner.name} won #{@turn.spoils_of_war.length} cards."
    #   @turn.award_spoils(winner)
    # end



#     while @player1.has_lost? == false && @player2.has_lost? == false
#       turn += 1
#       @turn.type
#       winner = @turn.winner
#       @turn.pile_cards
#       if @turn.winner == 'No Winner'
#         p '*mutually assured desctrucion* 6 cards removed from play'
#       else
#         p "Turn #{turn}: #{winner.name} won #{@turn.spoils_of_war.length} cards."
#       end
#       @turn.award_spoils(winner)
#       if turn == 10_000
#         p '---- DRAW ----'
#         break
#       end
#     end
#   end
# end
