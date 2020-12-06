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
      init_game_loop
    else
      resetter
    end
  end

  # nudge user, return to start prompts
  def resetter
    p "Invalid command. Re-initializing game state..."
    start
  end

  # if turn.type == :basic
    # p "#{turn.turn_winner} won 2 cards"
  # end
end
