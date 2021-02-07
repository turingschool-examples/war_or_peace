require 'pry'
class PlayGame
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @number_of_turns = 1
  end

  def announce_winner

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
    turn = Turn.new(@player1, @player2)

    while @number_of_turns < 1000001

      if turn.type == :basic
          winner = turn.winner
          p "Turn #{@number_of_turns}: #{winner.name} won 2 cards"
          turn.pile_cards
          turn.award_spoils(winner)
      elsif turn.type == :war
          winner = turn.winner
          p "Turn #{@number_of_turns}: WAR - #{winner.name} won 6 cards"
          turn.pile_cards
          turn.award_spoils(winner)
          break
      else turn.type == :mutually_assured_destruction
          p "Turn #{@number_of_turns}: *mutually assured destruction* 6 cards removed from play"
      end

      @number_of_turns += 1
      if @number_of_turns == 1000001
        p "---- DRAW ----"
      end
    end

    if @player1 == winner
      p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    else @player2 == winner
      p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    end
  end
end
