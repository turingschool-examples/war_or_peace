class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p"Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"

    input = gets.chomp.upcase

    until input == 'GO'
      p "Error! Invalid input. Please try again."
      input = gets.chomp.upcase
    end
    play_turns
  end

  def play_turns
    turn_counter = 1
    turn = Turn.new(player1, player2)

    while turn_counter >= 1
      turn.pile_cards

      if @player1.has_lost?
        puts " *~*~*~* #{@player2.name} has won the game! *~*~*~*"
        break
      elsif @player2.has_lost?
        puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        break
      end

      if turn.type == :basic
         winner = turn.winner
         puts "Turn #{turn_counter}: #{winner.name} won 2 cards"
         turn.award_spoils(winner)
      elsif turn.type == :war
        winner = turn.winner
        puts "Turn #{turn_counter}: WAR - #{winner.name} won 6 cards"
        turn.award_spoils(winner)
      elsif turn.type == :mutually_assured_destruction
        puts "Turn #{turn_counter}: *mutually assured destruction 6 cards removed from play"
      end

      turn_counter += 1

      if turn_counter == 1000000
        puts "---- DRAW ----"
        break
      end
    end
  end
end
