class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    # Perform turn operations
    until game_winner do
      # Create a turn
      turn = create_turn

      # Perform the turn
      do_turn(turn)

      # Print turn message
      puts turn_summary_message(turn)
    end

    game_over_message
  end

  private

  def create_turn
    Turn.new(@player1, @player2)
  end

  def do_turn(turn)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
  end

  def game_winner
    if @player1.has_lost?
      @player2
    elsif @player2.has_lost?
      @player1
    else
      nil
    end
  end

  def turn_summary_message(turn)
    ""
  end

  def game_over_message
    ""
  end
end
