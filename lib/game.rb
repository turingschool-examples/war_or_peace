class Game
  attr_reader :player1, :player2, :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
  end

  def start
    game_loop
    display_game_result
  end

  def game_loop
    until game_over?
      turn = Turn.new(player1, player2) #don't really need a new turn object every time. Pile_cards advances the turn.
      @turn_count += 1
      #do turn stuff
      turn_winner = turn.winner
      turn_type = turn.type
      turn.pile_cards

      if turn_type == :basic
        p "Turn #{turn_count}: #{turn_winner.name} has won #{turn.spoils_of_war.count} cards"
      elsif turn_type == :war
        p "Turn #{turn_count}: WAR - #{turn_winner.name} has won #{turn.spoils_of_war.count} cards"
      else #mutually_assured_destruction
        p "Turn #{turn_count}: *mutually assured destruction* - 6 cards removed from play"
      end

      turn.award_spoils(turn_winner)
    end
  end

  def game_over?
    player1.has_lost? || player2.has_lost? || turn_count == 1000000
  end

  def display_game_result
    if player1.has_lost?
      puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost?
      puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    else
      puts "---- DRAW ----"
    end
  end

end
