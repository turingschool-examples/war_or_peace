require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game

  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    user_input = gets.chomp
    if user_input == "GO"
      run_game
    end
  end

  def run_game
    @turn_count = 0
    until @player1.has_lost? || @player2.has_lost? || @turn_count == 1000000
      turn = Turn.new(player1, player2)
      @turn_count += 1
      if turn.type == :basic
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        p "Turn #{@turn_count}: #{winner.name} has won 2 cards!"
      elsif turn.type == :war
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        p "Turn #{@turn_count}: WAR - #{winner.name} has won 6 cards!"
      else
        winner = turn.winner
        turn.pile_cards
        p "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play!"
      end
    end
    if player1.has_lost?
      p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost?
      p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    elsif @turn_count == 1000000
      p "---- DRAW ----"
    end
  end

end
