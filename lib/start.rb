class Start
  attr_reader :turn

  def initialize(turn)
    @turn = turn
    @turn_count = 0
  end

  def turn_count
    @turn_count += 1
  end

  def start_game
    say_turn_winner
    turn.award_spoils(turn.winner)
  end

  def say_turn_winner
    if turn.type == :mutually_assured_destruction
      p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
    elsif turn.type == :basic
      p "Turn #{turn_count}: #{turn.winner.name} won 2 cards"
    elsif turn.type == :war
      p "Turn #{turn_count}: WAR - #{turn.winner.name} won 6 cards"
    end
  end


  def announce_winner
    if turn.player1.has_lost?
      puts "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
    elsif turn.player2.has_lost?
      puts "*~*~*~* #{turn.player1.name} has won the game! *~*~*~*"
    elsif @turn_count == 1000001
      "---- DRAW ----"
    end
  end
end
