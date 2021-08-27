class StartGame
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    winner = @player1
    turn_num = 1
    while turn_num <= 1000000 do
      turn = Turn.new(@player1, @player2)

      turn.pile_cards

      winner = turn.winner

      turn.award_spoils(winner)

      if turn.type == :basic
        p "Turn #{turn_num}: #{winner.name} won 2 cards"
      elsif turn.type == :war
        p "Turn #{turn_num}: WAR - #{winner.name} won 6 cards"
      elsif turn.type == :mutually_assured_destruction
        p "Turn #{turn_num}: *mutually assured destruction* 6 cards removed from play"
      else
        p "error: no turn type"
      end

      turn_num += 1
    end
    if turn_num == 1000000
      p "--- DRAW ---"
    else
      p "*~*~*~* #{winner.name} has won the game! *~*~*~*"
    end
  end
end
