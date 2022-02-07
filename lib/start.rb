require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class Start
  attr_reader :player1, :payer2, :turn, :turn_number

  def initialize(turn)
    @player1 = turn.player1
    @player2 = turn.player2
    @turn = turn
    @turn_number = 0
  end

  def game_over
    if @player1.has_lost? == true
      puts "*~*~*~* #{@player2.name} has won the game *~*~*~*"
    elsif @player2.has_lost? == true
      puts "*~*~*~* #{@player1.name} has won the game *~*~*~*"
    elsif @turn_number == 1000000
      puts "---- DRAW ----"
    end
  end

  def start_game
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    # get user input
    input = gets.chomp
    # play the game
    if input == 'GO'
      until @player1.has_lost? == true || @player2.has_lost? == true || @turn_number == 1000000
        winner = turn.winner
        if turn.type == :mutually_assured_destruction
          @turn_number += 1
          turn.pile_cards
          puts "Turn #{@turn_number}:*mutually assured destruction* 6 cards removed from play."
        elsif turn.type == :basic
          @turn_number += 1
          turn.pile_cards
          puts "Turn #{@turn_number}:"+" #{winner.name} won #{turn.spoils_of_war.count} cards."
          turn.award_spoils(winner)
        elsif turn.type == :war
          @turn_number += 1
          turn.pile_cards
          puts "Turn #{@turn_number}:"+" WAR - #{winner.name} won #{turn.spoils_of_war.count} cards."
          turn.award_spoils(winner)
        end
        game_over
      end

    end
  end
end
