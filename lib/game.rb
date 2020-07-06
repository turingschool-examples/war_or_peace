require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn.rb'
require "pry"

class Game
attr_reader :number_of_current_turn, :player1, :player2


  def initialize(number_of_current_turn, player1, player2)
    @number_of_current_turn = number_of_current_turn
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards"
    p "The players today are Megan and Aurora."
    p "Type GO to start the game!"
    p "-----------------------------------------------------------------"

    start_game = gets.chomp
  end

  #doesn't work, I dont understand why player1 and player2 are out of scope in this class method but I can call methods in the turn class that originate from another class. Ran out of time.
  def run
    until player1.has_lost? || player2.has_lost? do
      p game.number_of_current_turn
      turn = Turn.new(player1, player2)
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      @number_of_current_turn + 1
    end
  end
end
