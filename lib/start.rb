require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class Start
  attr_reader :player1, :payer2

  def initialize(turn)
    @player1 = turn.player1
    @player2 = turn.player2
  end

  def start_game
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    input = gets.chomp
    if input == 'GO'
      puts "Lorem Ipsum"
    end
  end

end
