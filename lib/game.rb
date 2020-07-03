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
        break if end_game?(counter)
        turn = Turn.new(@player1, @player2)
        turn_winner = turn.winner
        turn_message(turn, counter, turn_winner)
        turn.pile_cards
        determine_spoils(turn, turn_winner)
        counter += 1
      end

      game_winner = determine_winner()
      announce_winner(game_winner)
    end
  end

  def display_greeting
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are #{@player1.name} and #{@player2.name}.\nType 'GO' to start the game!\n------------------------------------------------------------------"
  end

  def get_user_input
    @signal = gets.chomp.upcase
  end

  def end_game?(counter)
    if counter == 999_999
      puts "---- DRAW ----"
      true
    end
  end

  def turn_message(turn, counter, turn_winner)
    if turn.type == :basic
      puts "Turn #{counter + 1}: #{turn_winner.name} won 2 cards - for a total of #{turn_winner.deck.cards.length + 2 }"
    elsif turn.type == :war
      puts "Turn #{counter + 1}: WAR - #{turn_winner.name} won 6 cards - for a total of #{turn_winner.deck.cards.length + 6 }"
    else
      puts "*mutually assured destruction* 6 cards removed from play"
    end
  end

  def determine_spoils(turn, turn_winner)
    unless turn_winner == "No Winner"
      turn.award_spoils(turn_winner)
    end
  end

  def determine_winner
    if @player1.has_lost?
      @player2
    else
      @player1
    end
  end

  def announce_winner(winner)
    puts "*~*~*~* #{winner.name} has won the game! *~*~*~*"
  end
end
