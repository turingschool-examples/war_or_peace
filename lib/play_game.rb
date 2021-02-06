require 'pry'
class PlayGame
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @number_of_turns = 0
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p  "Type 'GO' to start the game!"
    p  "------------------------------------------------------------------"

    player_input = gets.chomp.upcase

    unless player_input == 'GO'
      p "Enter GO"
      player_input = gets.chomp.upcase
    end
    play_turn
  end

  def play_turn
    # @number_of_turns += 1
    number_of_turns
    turn = Turn.new(@player1, @player2)


    if @number_of_turns >= 1

      turn.pile_cards


      if turn.type == :basic
        winner = turn.winner
        p "Turn #{@number_of_turns}: #{winner.name} won 2 cards"
      elsif turn.type == :war
        winner = turn.winner
        p "Turn #{@number_of_turns}: WAR - #{winner.name} won 6 cards"
      else turn.type == :mutually_assured_destruction
        p "Turn #{@number_of_turns}: *mutually assured destruction* 6 cards
          removed from play"
      end


      if winner == @player2
        p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
      else winner == @player1
        p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
      end

      # if @number_of_turns == 1000000
      #   p "---- DRAW ----"
      # end
    end
  end

  def number_of_turns
    @number_of_turns += 1
    if @number_of_turns == 1000000
      p "---- DRAW ----"
    end
  end

end
