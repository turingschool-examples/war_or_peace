require './lib/turn'

class Game
  attr_reader :turn_count, :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 1
    @game_winner = ""
  end

  def start
    puts "Welcome to War! (or Peace). This game will be played with 52 cards."
    puts "The players today are #{@player1.name} and #{@player2.name}."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    input = gets.chomp

    if input.upcase == "GO"
      play
    else
      puts "You gotta type 'GO' to start the game!!!"
      # figure out how to make this then go back to original 'input' gets method
    end
  end

  def play
    until @turn_count == 1000001
      turn = Turn.new(@player1, @player2)

      if turn.type == :basic
        winner = turn.winner
        turn.pile_cards
        # turn.spoils_of_war.shuffle
        cards_to_winner = turn.spoils_of_war.count
        turn.award_spoils(winner)

        p "Turn #{@turn_count}: #{winner.name} won #{cards_to_winner} cards"
      elsif turn.type == :war
        winner = turn.winner
        turn.pile_cards
        # turn.spoils_of_war.shuffle
        cards_to_winner = turn.spoils_of_war.count
        turn.award_spoils(winner)

        p "Turn #{@turn_count}: WAR - #{winner.name} won #{cards_to_winner} cards"

      elsif turn.type == :mutually_assured_destruction
        turn.pile_cards

        p "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
      end

      @game_winner = @player1.name if @player2.has_lost?
      @game_winner = @player2.name if @player1.has_lost?

      @turn_count += 1
      if @player1.has_lost? || @player2.has_lost? || @turn_count == 1000000
        break
        p "---- DRAW ----"
      end
    end

    display_game_result
  end

  def display_game_result
    p "*~*~*~* #{@game_winner} has won the game! *~*~*~*"
  end
end
