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

    user = gets.chomp.upcase

    if user == "GO"
      play
    else
     puts "Type 'GO'"
    end
  end

  def play

    until turn.player_1.has_lost? || turn.player_2.has_lost?
      if turn.type == :basic
        turn.winner
        turn.pile_cards
        turn.award_spoils(turn.winner)
        @num_of_turns += 1
        p "Turn #{num_of_turns}: BASIC - #{turn.winner.name} won 2 cards"
      elsif turn.type == :war
        turn.winner
        turn.pile_cards
        turn.award_spoils(turn.winner)
        @num_of_turns += 1
        p "Turn #{num_of_turns}: WAR - #{turn.winner.name} won 6 cards"
      elsif turn.type == :mutually_assured_destruction
        turn.pile_cards
        @num_of_turns += 1
        p "Turn #{num_of_turns}: *mutually assured destruction* 6 cards removed from play"
      end

      break if @num_of_turns == 100000

    end

    if turn.player_1.has_lost? == true
      p "*~*~*~* #{turn.player_2.name} has won the game!*~*~*~*"
    elsif turn.player_2.has_lost? == true
      p "*~*~*~* #{turn.player_1.name} has won the game!*~*~*~*"
    else
      p "----DRAW----"
    end
  end
end
