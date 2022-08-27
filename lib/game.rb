require 'pry'

class Game
attr_reader :num_of_turn, :player_1, :player_2

  def initialize(player_1, player_2)

    @player_1 = player_1
    @player_2 = player_2
    @num_of_turns = 0
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player_1.name} and #{player_2.name}."
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
    until @player_1.has_lost? || @player_2.has_lost?
      turn = Turn.new(@player_1, @player_2)
      type = turn.type
      if type == :basic
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        @num_of_turns += 1
        if winner
          p "Turn #{@num_of_turns}: BASIC - #{winner.name} won 2 cards"
        end
      elsif type == :war
        turn.winner
        turn.pile_cards
        turn.award_spoils(turn.winner)
        @num_of_turns += 1
        if turn.winner
          p "Turn #{@num_of_turns}: WAR - #{turn.winner.name} won 6 cards"
        end
      elsif type == :mutually_assured_destruction
        turn.pile_cards
        @num_of_turns += 1
        p "Turn #{@num_of_turns}: *mutually assured destruction* 6 cards removed from play"
      end

      break if @num_of_turns == 100000
    end

    declare_winner
  end

  def declare_winner
    if @player_1.has_lost?
      p "Turn #{@num_of_turns}: *~*~*~* #{@player_2.name} has won the game!*~*~*~*"
    elsif @player_2.has_lost?
      p "Turn #{@num_of_turns}: *~*~*~* #{@player_1.name} has won the game!*~*~*~*"
    else
      p "----DRAW----"
    end
  end
end
