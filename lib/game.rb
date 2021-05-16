require './lib/turn'

class Game
  attr_reader :start

  def initialize
    @start = start
    @turn = Turn.new(@player1, @player2)
  end

  def turns
    turns = 0
  end

  def start
    if @player1.has_lost? != true do
      if @player2.has_lost != true do
        if @turns != 1000000 do
          winner = @turn.winner
          @turn.pile_cards
          @turn.award_spoils(winner)
          @turns += 1
        end
      end
    end
    p @winner
  end
