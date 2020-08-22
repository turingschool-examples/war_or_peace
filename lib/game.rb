class Game
  attr_reader :player1, :player2, :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 1
  end

  def start
    game_loop
    puts display_game_result
  end

  def game_loop
    until game_over?
      turn = Turn.new(player1, player2)
      turn_winner = turn.winner
      turn_type = turn.type

      turn.pile_cards
      turn.award_spoils(turn_winner)

      puts display_turn_result(turn, turn_winner, turn_type)

      @turn_count += 1
    end
  end

  def game_over?
    player1.has_lost? || player2.has_lost? || turn_count == 1000000
  end

  def display_game_result
    if player1.has_lost?
      "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost?
      "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    else
      "---- DRAW ----"
    end
  end

  def display_turn_result(turn, turn_winner, turn_type)
    if turn_type == :basic
      "Turn #{turn_count}: #{turn_winner.name} has won #{turn.spoils_of_war.count} cards"
    elsif turn_type == :war
      "Turn #{turn_count}: WAR - #{turn_winner.name} has won #{turn.spoils_of_war.count} cards"
    else #mutually_assured_destruction
      "Turn #{turn_count}: *mutually assured destruction* - #{turn.cards_removed_from_play.count} cards removed from play"
    end
  end

end
