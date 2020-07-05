class Game
  attr_reader :player1, :player2, :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
  end

  def turn_message(turn)
    if turn.type == :basic
      p "Turn #{@turn_count}: #{turn.winner.name} won 2 cards!"
    elsif turn.type == :war
      p "Turn #{@turn_count}: WAR - #{turn.winner.name} won 6 cards!"
    else
      p "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
    end
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are #{@player1.name} and #{@player2.name}"
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"

    print ">>>>"
    start = gets.chomp.upcase!

    if start == "GO"
      @turn_count = 1
      until @player1.has_lost? || @player2.has_lost? do
        @turn = Turn.new(@player1, @player2)

        @turn.pile_cards
        @turn.award_spoils(@turn.winner)
        turn_message(@turn)

        @turn_count += 1
        if @turn_count == 1000000
          p "-----DRAW----"
          break
        end
      end
    p  "*~*~*~* #{@turn.winner.name} has won the game! *~*~*~*"
    end
  end
end
