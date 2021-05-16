require './lib/turn'

class Game
  attr_accessor :start

  def initialize
    @start = start
    @turn = Turn.new(@player1, @player2)
  end

  def turns
    turns = 0
  end

  def start
    unitl @player1.has_lost?(true) do
      winner = @turn.winner
      @turn.pile_cards
      @turn.award_spoils(winner)
      @turns += 1
    end
    p @winner
  end
end
