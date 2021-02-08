require './lib/card'
require './lib/deck'
require './lib/player'
require  './lib/turn'
class Game
  attr_reader :player1,
              :player2
  def initialize(player1, player2)
    @player1     = player1
    @player2     = player2
    @turn_number = 1
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"

    user_input = gets.chomp

    if user_input == "GO"
      play
    end
  end

  def winner_announcement
    if player1.has_lost? == true
      p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost? == true
      p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    else
      p "--- DRAW ---"
    end
  end

  def check_winner?
    player1.has_lost? || player2.has_lost? || @turn_number == 1000000
    # needs to return true or false based on if players have lost or count is 10000
  end

  def play
    until check_winner?
      turn = Turn.new(player1, player2)
      if !player1.has_lost? || !player2.has_lost? || @turn_number != 1000000
        make_turn_go(turn)
      end
    end
    winner_announcement
  end

  def make_turn_go(turn)
    @turn_number += 1
    turn.pile_cards
   if turn.type == :basic
        winner = turn.winner
        turn.award_spoils(winner)
        p "Turn #{@turn_number}, #{winner.name} has won 2 cards"
    elsif turn.type == :war
        winner = turn.winner
        turn.award_spoils(winner)
        p "Turn #{@turn_number}, WAR - #{winner.name} has won 6 cards"
    elsif turn.type == :mutually_assured_destruction
        winner = turn.winner
        p "Turn #{@turn_number}, *mutually assured destruction* 6 cards removed from play"
    end
  end
end
