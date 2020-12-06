require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'turn'

class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p '------------------------------------------------------------------'
    user_command = gets.chomp
    if user_command == 'GO'
      game_loop
    else
      resetter
    end
  end

  # nudge user, return to start prompts
  def resetter
    p "Invalid command. Re-initializing game state..."
    start
  end

  def turn_output(turn_type, turn_counter, turn_winner)
    if turn_type == :basic
      p "Turn #{turn_counter}: #{turn_winner.name} won 2 cards"
    elsif turn_type == :war
      p "Turn #{turn_counter}: WAR - #{turn_winner.name} won 6 cards"
    elsif turn_type == :mutually_assured_destruction
      p "Turn #{turn_counter}: *mutually assured destruction* 6 cards removed from play"
    end
  end

  def win_output(player)
    p "*~*~*~* #{player.name} has won the game! *~*~*~*"
  end

  def game_loop
    turn_counter = 1
    while turn_counter <= 1000000
      if @player1.has_lost?
        win_output(@player2)
        break
      elsif @player2.has_lost?
        win_output(@player1)
        break
      elsif turn_counter == 1000000
        turn = Turn.new(@player1, @player2)
        turn_type = turn.type
        turn.pile_cards
        turn.award_spoils
        turn_output(turn_type, turn_counter, turn.turn_winner)
        p '---- DRAW ----'
        break
      else
        turn = Turn.new(@player1, @player2)
        turn_type = turn.type
        turn.pile_cards
        turn.award_spoils
        turn_output(turn_type, turn_counter, turn.turn_winner)
      end
      turn_counter += 1
    end
  end
end
