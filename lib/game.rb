require_relative 'turn'
require 'pry'
class Game
  attr_reader :player1
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def intro
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are #{@player1.name} and #{@player2.name}."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
  end

  def get_answer
    answer = gets.chomp
    if answer.upcase.gsub(" ", "") != "GO"
      puts "You must type 'GO' in order to start the game."
      false
    else
      true
    end
  end

  def start_game
    x = 1
    while x <= 1000000 do
      game_over = take_turn
      output_turn_results(x)
      break if has_lost
      if x == 100000
        puts "---- DRAW ----"
        return
      end
      x += 1
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
      puts "Turn #{turn_num}: #{@winner.name} won #{@num_cards} cards. #{@player1.deck.cards.count} #{@player2.deck.cards.count} "
    elsif @turn_type == :war
      puts "Turn #{turn_num}: WAR - #{@winner.name} won #{@num_cards} cards. #{@player1.deck.cards.count} #{@player2.deck.cards.count} "
    end
  end

  def has_lost
    if @player1.has_lost?
      puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
      true
    elsif @player2.has_lost?
      puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
      true
    end
    false
  end
end
