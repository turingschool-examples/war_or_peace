class Game
  attr_reader :player1, :player2, :turn_number

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_number = 1
  end

  def turn_messages(turn_number, turn_type, turn_winner)
    if turn_type == :mutually_assured_destruction
      "Turn #{turn_number}: *mutually assured destruction* 6 cards removed from play"
    elsif turn_type == :basic
      "Turn #{turn_number}: #{turn_winner} won 2 cards"
    elsif turn_type == :war
      "Turn #{turn_number}: WAR - #{turn_winner} won 6 cards"
    end
  end

  def final_message
    if player1.has_lost?
      "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost?
      "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    else
      "---- DRAW ----"
    end
  end


end
