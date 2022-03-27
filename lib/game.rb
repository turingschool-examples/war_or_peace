require './lib/turn.rb'
require 'pry'


class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    turn_count = 0
    until @player1.has_lost? || @player2.has_lost? || turn_count == 1000000 do
      turn = Turn.new(@player1, @player2)
  # binding.pry
      turn.pile_cards
      turn.winner
      turn.award_spoils
      turn_count += 1
    end
    binding.pry
  end
end
