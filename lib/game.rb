require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
  
  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.\n"
    puts "The players today are #{player1.name} and #{player2.name}.\n"
    puts "Type 'GO' to start the game!"
  
    user_input = gets.chomp
    turn_count = 0
    until player1.has_lost? || player2.has_lost? do
      turn_count += 1
      turn = Turn.new(player1, player2)
      turn_winner = turn.winner
      if turn.type == :basic
        puts "Turn #{turn_count}: #{turn_winner.name} won 2 cards!\n"
      elsif turn.type == :war
        puts "Turn #{turn_count}: WAR - #{turn_winner.name} won 6 cards\n"
      elsif turn.type == :mutually_assured_destruction
        puts "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play\n"
      else
        puts "Something is wrong here..."
      end
      turn.pile_cards
      turn.award_spoils(turn_winner)
      
      if player1.has_lost? || player2.has_lost?
        puts "*~*~*~* #{turn_winner.name} has won the game! *~*~*~*"
      end
      if turn_count == 1000000
        puts "---- DRAW ----"
        break
      end
    end
    # if user_input == "GO"
    #   p 'Game has started'
    # else
    #   puts "Sorry, that was not a valid response.\n"
    #   puts "Type 'GO' to start the game!"
    #   gets.chomp
    # end
  end
end