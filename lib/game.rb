require 'pry'

class Game

  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1} and #{player2}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    user_input = gets.chomp
  end
end
