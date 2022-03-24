class Game
  # require 'rspec'
  # require './lib/deck'
  # require './lib/card'
  # require './lib/player'
  # require './lib/turn'
  # require './lib/game'

  attr_reader :player1, :player2, :turn_counter

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_counter = 0
    # require 'pry'; binding.pry

  end

  def start


    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'Go' to start the game!"

    # require 'pry'; binding.pry
    starter_input = gets.chomp
    p starter_input
    require 'pry'; binding.pry

  end

end
