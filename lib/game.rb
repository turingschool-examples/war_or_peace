require_relative "./turn"

class Game
 attr_reader  :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    welcome_message
  end

  def welcome_message
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}"
    p "Type 'GO' to start the game!"
    p "---------------------------------------------"

    user_input = get_info
    validate_input(user_input)
  end

  def get_info
     gets.chomp.upcase
  end
#
  def validate_input(user_input)
    counter_input = 0
    loop do
        if user_input == "GO"
          start_game
        elsif counter_input < 3
          p "Invalid entry, please type 'GO' to start"
          get_info
          counter_input += 1
        else counter_input == 3
          p "Not today, GOODBYE!"
          break
        end
    end
  end

  def start_game
    counter = 1
    until winning_condition(counter) do
      turn = Turn.new(@player1, @player2)
      p "TURN TYPE: #{turn.type}"
      # require "pry"; binding.pry
      winner = turn.winner
        if turn.type == :basic
          basic_turn(turn, winner, counter)
        elsif turn.type == :war
          war_turn(turn, winner, counter)
        else
          mad_turn(turn, counter)
        end
      print_turn_summary(turn, winner, counter)
      counter += 1
    end
    game_completion
  end

  def print_turn_summary(turn, winner, counter)
    # require "pry"; binding.pry if winner == "No Winner"
    case turn.type
    when :basic
      p "Turn #{counter}: #{winner.name} won 2 cards"
    when :war
      p "Turn #{counter}: #{winner.name} won 6 cards"
    when :mutually_assured_destruction
      p "Turn #{counter}: *mutally assured destruction* 6 cards removed from play"
    end
  end

  def winning_condition(counter)
    @player1.has_lost? || @player2.has_lost? || counter == 1_000_000
  end

  def basic_turn(turn, winner, counter)
    turn.pile_cards
    turn.award_spoils(winner)

  end

  def war_turn(turn, winner, counter)
    turn.pile_cards
    turn.award_spoils(winner)

  end

  def mad_turn(turn, counter)
    turn.pile_cards

  end

  def game_completion
    if @player1.deck.cards.count == 0
      p "*~*~*~* #{@player2.name} won! *~*~*~*"
    elsif @player2.deck.cards.count == 0
      p "*~*~*~* Congrats #{@player1.name}! *~*~*~*"
    else
      p "It's a draw, Captain!"
    end
  end

end
