require 'card.rb'
require 'deck.rb'
require 'player.rb'
require 'turn.rb'
require 'game.rb'

class Game
attr_reader :turn, :num_of_turns

  def initialize(turn)
    @turn = turn
    @num_of_turns = 0
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{turn.player_1.name} and #{turn.player_2.name}."
    p "Type 'GO' to start the game!"
    p  "------------------------------------------------------------------"

    driver = gets.chomp.upcase

    if driver == "GO"
      play
    else
     p "Type 'GO'"
    end
  end

  # def play
  #   @num_of_turns
  #   @turn
  #   until turn.player_1.has_lost? || turn.player_2.has_lost?


  # end










end
