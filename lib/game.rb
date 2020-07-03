require_relative "./turn"

class Game
 attr_reader  :player1,
              :player2,
              :counter,
              :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @counter = 1
  end

  def start
    welcome_message
  end

  def welcome_message
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}"
    p "Type 'GO' to start the game!"
    p "---------------------------------------------"


    get_user_input
  end

  # def standardize_entry
  #   gets.chomp.upcase
  # end

  def get_user_input
    ui_counter = 0

    while ui_counter != 3 do
      user_input = gets.chomp.upcase
      if user_input != "GO"
        p "Invalid entry, please type 'GO'."
        ui_counter += 1
      else
        start_game
        break
      end
    end

    if ui_counter == 3
      p "Not today....GOODBYE!"
    end


  end


  def start_game
    until winning_condition do
      @turn = Turn.new(@player1, @player2)
      turn.pile_cards
      turn.award_spoils(turn.winner)
      print_turn_summary(turn)
      @counter += 1
    end
    game_completion
  end

  def print_turn_summary(turn)
    case turn.type
    when :basic
      p "Turn #{counter}: #{turn.winner.name} won 2 cards"
    when :war
      p "Turn #{counter}: #{turn.winner.name} won 6 cards"
    when :mutually_assured_destruction
      p "Turn #{counter}: *mutally assured destruction* 6 cards removed from play"
    end
  end

  def winning_condition
    @player1.has_lost? || @player2.has_lost? || counter == 1_000_000
  end

  def game_completion
    if @player1.has_lost?
      p "*~*~*~* Congrats #{@player2.name}! YOU WON! *~*~*~*"
    elsif @player2.has_lost?
      p "*~*~*~* Congrats #{@player1.name}! YOU WON! *~*~*~*"
    else
      p "It's a draw, Captain!"
    end
  end

end
