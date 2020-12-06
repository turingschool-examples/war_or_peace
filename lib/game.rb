require './lib/player'
require './lib/turn'

class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @max_turns = 1000000
  end

  def start
    # Perform turn operations
    turn_counter = 0
    until game_winner do
      turn_counter += 1

      # Create a turn
      turn = create_turn

      # Perform the turn
      do_turn(turn)

      # Print turn message
      puts turn_summary_message(turn, turn_counter)

      break if turn_counter == @max_turns
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

  def turn_summary_message(turn, turn_number)
    case turn.type
    when :basic
      "Turn #{turn_number}: #{turn.winner.name} won #{turn.cards_used} cards"
    when :war
      "Turn #{turn_number}: WAR - #{turn.winner.name} won #{turn.cards_used} cards"
    when :mutually_assured_destruction
      "Turn #{turn_number}: *mutually assured destruction* #{turn.cards_used} cards removed from play"
    end
  end

  def game_over_message
    if game_winner.nil?
      "---- DRAW ----"
    else
      "*-*-*-* #{game_winner.name} has won the game! *-*-*-*"
    end
  end
end
