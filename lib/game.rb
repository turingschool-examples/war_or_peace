class Game

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are Megan and Aurora."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    user_input
  end

  def user_input
    input = gets.chomp.downcase
    if input == "go"
      game_play
    end
  end

  def game_play
    turn_counter = 1
    until @player_1.has_lost? || @player_2.has_lost? || turn_counter == 100000

      turn = Turn.new(@player_1, @player_2)

      turn.pile_cards
      if turn.type == :basic
        puts "Turn #{turn_counter} #{turn.winner.name} won 2 cards"
        turn.award_spoils(turn.winner)

      elsif turn.type == :war
        puts "Turn #{turn_counter} WAR - #{turn.winner.name} won 6 cards"
        turn.award_spoils(turn.winner)

      elsif turn.type == :mutually_assured_destruction
        puts "Turn #{turn_counter} *mutually assured destruction* 6 cards removed from play"
      end

      turn_counter += 1
    end

      if turn_counter == 100000
        puts "---- DRAW ----"
      elsif @player_1.has_lost?
        puts  "*~*~*~* #{@player_2.name} has won the game! *~*~*~*"
      else
        puts  "*~*~*~* #{@player_1.name} has won the game! *~*~*~*"
    end
  end
end
