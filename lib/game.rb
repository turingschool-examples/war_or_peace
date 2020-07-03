require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class Game
  attr_reader :turn, :turn_number

  def initialize(turn)
    @turn = turn
    @turn_number = 0
  end

  def win_game

    if turn.player1.has_lost?
    "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"
  elsif turn.player2.has_lost?
    "*~*~*~* #{turn.player1.name} has won the game! *~*~*~*"
    end
  end

  def start
    # until  turn.player1.has_lost? || turn.player2.has_lost? do
    #   @turn_number += 1
    loop do
      if turn.type == :basic
        turn.pile_cards
        winner = turn.winner
        p "Turn #{@turn_number}: #{turn.winner.name} won 2 cards"
        turn.award_spoils(winner)
      elsif turn.type == :war
        turn.pile_cards
        winner = turn.winner
        p "Turn #{@turn_number}: WAR - #{turn.winner.name} won 6 cards"
        turn.award_spoils(winner)
      elsif turn.type == :mutually_assured_destruction
        turn.pile_cards
        p "Turn #{@turn_number}: *mutually assured destruction* 6 cards removed from play"
      end
    end
  end

end
