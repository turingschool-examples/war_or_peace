require './lib/turn'

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    display_greeting
    get_user_input
    if @signal == "GO"
      counter = 0
      until @player1.has_lost? || @player2.has_lost?
        # TODO: Make this it's own method
        if counter == 999_999
          puts "---- DRAW ----"
          break
        end
        turn = Turn.new(@player1, @player2)
        turn_winner = turn.winner
        turn.pile_cards
        unless turn_winner == "No Winner"
          turn.award_spoils(turn_winner)
        end
        turn_message(turn, turn_winner, counter)
        counter += 1
      end
    require 'pry'; binding.pry
      # if @player1.has_lost?
      #   turn


    end

  end

  def display_greeting
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are #{@player1.name} and #{@player2.name}.\nType 'GO' to start the game!\n------------------------------------------------------------------"
  end

  def get_user_input
    @signal = gets.chomp.upcase
  end

  def turn_message(turn, winner, counter)
    if turn.type == :basic
      puts "Turn #{counter + 1}: #{winner.name} won 2 cards"
    elsif turn.type == :war
      puts "Turn #{counter + 1}: WAR - #{winner.name} won 6 cards"
    else
      puts "*mutually assured destruction* 6 cards removed from play"
    end
  end

end
