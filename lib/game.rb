class Game
  attr_reader :player1, :player2, :count
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @count = 0
  end
  def start
    puts "Welcome to War! (or Peace) This Game will be played with 52 cards."
    puts "The players today are #{player1.name} and #{player2.name}."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"

    command = nil
    while command != "GO"
      command = gets.chomp
      "Type 'GO' to start the game!"
    end
    
    while player1.has_lost? == false || player2.has_lost? == false
      turn = Turn.new(player1, player2)
      type = turn.type
      if type == :basic
        winner = turn.winner
        turn.pile_cards
        puts "Turn #{count}: #{winner.name} won #{turn.spoils_of_war.count} cards"
        @count += 1
        turn.award_spoils(winner)
      elsif type == :war
        winner = turn.winner
        turn.pile_cards
        puts "Turn #{count}: WAR - #{winner.name} won #{turn.spoils_of_war.count} cards"
        @count += 1
        turn.award_spoils(winner)
      else
        puts "Turn #{count}: *mutually assured destruction* 6 cards removed from play"
        @count += 1
        turn.pile_cards
      end
      if player1.has_lost? == true
        puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
        break
      elsif player2.has_lost? == true
        puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
        break
      end
      if @count > 1000000
        puts "---- DRAW ----"
        break
      end
    end
  end
end