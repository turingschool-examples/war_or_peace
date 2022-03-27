class Start
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_index = 0
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"

    loop do
      game_start = gets.chomp

      if game_start == "GO"
        1000000.times do
          if player1.has_lost? == false && player2.has_lost? == false
            turn = Turn.new(player1, player2)
            if turn.type == :basic
              p "Turn #{@turn_index += 1}: #{turn.winner.name} won 2 cards"
              winner = turn.winner
              turn.pile_cards
              turn.award_spoils(winner)
            elsif turn.type == :war
              p "Turn #{@turn_index += 1}: WAR - #{turn.winner.name} won 6 cards"
              winner = turn.winner
              turn.pile_cards
              turn.award_spoils(winner)
            elsif turn.type == :mutually_assured_destruction
              p "Turn #{@turn_index += 1}: *mutually assured destruction* 6 cards removed from play"
              turn.pile_cards
            elsif turn.type == :not_enough_cards
              p "Draw. Someone ran out of cards."
              break
            else
              raise p "Err."
            end
          elsif player1.has_lost? == true
            p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
            exit
          elsif player2.has_lost? == true
            p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
            exit
          else
            raise "Err. Winner unknown."
          end
        end
        p "---- DRAW ----"
        break
      elsif game_start == "EXIT"
        break
      else
        p "Please type 'GO' to start the game, or 'EXIT' to cancel."
      end
    end
  end
end
