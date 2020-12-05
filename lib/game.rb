require_relative 'turn'
require 'pry'
class Game
  attr_reader :player1,
              :player2,
              :got_answer

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @got_answer = false
  end

  def intro
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are #{@player1.name} and #{@player2.name}."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    answer = gets.chomp
    if !get_answer(answer)
      puts "You must type 'GO' in order to start the game."
    end
  end

  def get_answer(answer)
    if answer.upcase.gsub(" ", "") != "GO"
      @got_answer = false
    else
      @got_answer = true
    end
  end

  def start_game
    turn = 1
    while turn <= 1000000 do
      take_turn
      output_turn_results(turn)
      break if game_over
      if turn == 100000
        puts "---- DRAW ----"
        return
      end
      turn += 1
    end
  end

  def take_turn
    turn = Turn.new(@player1, @player2)
    @turn_type = turn.type
    turn.pile_cards
    @winner = turn.winner
    @num_cards = turn.spoils_of_war.count
    turn.award_spoils(turn.winner)
  end

  def output_turn_results(turn_num)
    if @turn_type == :mutally_assured_destruction
      puts "Turn #{turn_num}: *mutally assured destruction* 6 cards removed from play"
    elsif @turn_type == :basic
      puts "Turn #{turn_num}: #{@winner.name} won #{@num_cards} cards."
    elsif @turn_type == :war
      puts "Turn #{turn_num}: WAR - #{@winner.name} won #{@num_cards} cards."
    end
  end

  def game_over
    if @player1.has_lost?
      puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
      return true
    elsif @player2.has_lost?
      puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
      return true
    end
    return false
  end
end
