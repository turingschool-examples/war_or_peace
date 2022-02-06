require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner'
require 'pry'

class Start

  def initialize
    @player1 = player1
    @player2 = player2
  end

def start_game
  p "Welcome to War! (or Peace) This game will be played with #{standard_deck.count} cards."
  p "The players today are #{player1.name} and #{player2.name}."
  p "Type 'GO' to start the game!"
  p "--------------------------------------------------------------------------------------"
  input = gets.chomp
  if input == 'GO'
    10.times do Turn.new
  end
end
 
