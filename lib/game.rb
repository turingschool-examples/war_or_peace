class Game
  def initialize
    @turn_count = 0
  end

  def start(player1, player2)
    p "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are #{player1.name} and #{player2.name}." "Type 'GO' to start the game!"
    reply = gets.chomp.upcase
    if reply == "GO"
      take_a_turn(player1, player2)
    end
  end

  def take_a_turn(player1, player2)
    if @turn_count < 1000000
      turn = Turn.new(player1, player2)
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      @turn_count += 1

        if turn.type == :basic
          p "Turn #{@turn_count}: #{winner.name} won"
        elsif turn.type == :mutually_assured_destruction
          p "Turn #{@turn_count}: *mutually assured destruction* 6 cards have been removed from play"
        elsif turn.type == :war
          p "Turn #{@turn_count}: WAR - #{winner.name} won 6 cards"
        end

        if player1.has_lost? == false && player2.has_lost? == false
          take_a_turn(player1, player2)
        elsif player1.has_lost? == true
          puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
        elsif player2.has_lost? == true
          puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
        else
          puts "---- DRAW ----"
        end
    else
      puts "---- DRAW ----"
    end

  end

end
