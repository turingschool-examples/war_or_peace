class Game
  attr_reader :player1, :player2, :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
    @current_turn = turn_count
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are #{player1.name} and #{player2.name}." "Type 'GO' to start the game!"
    reply = get_user_input
    response(reply)
  end

  def response(reply)
    if reply == "GO"
      take_a_turn
    end
  end

  def get_user_input
    reply = gets.chomp.upcase
  end

  def take_a_turn
    turn = Turn.new(player1, player2)

    if turn.type == :basic
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      @turn_count += 1
      p "Turn #{@turn_count}: #{winner.name} won"
      continue_playing

    elsif turn.type == :war
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      @turn_count += 1
      p "Turn #{@turn_count}: WAR - #{winner.name} won 6 cards"
      continue_playing

    elsif turn.type == :mutually_assured_destruction
      turn.pile_cards
      @turn_count += 1
      p "*mutually assured destruction* 6 cards removed from play"
      continue_playing
    end
  end

  def continue_playing
    if @turn_count < 1000 && player1.has_lost? == false && player2.has_lost? == false
      take_a_turn
    else
      end_game
    end
  end

  def end_game
    if player1.has_lost? == true
      p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost? == true
      p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    else
      p "---- DRAW ----"
    end
  end
end
