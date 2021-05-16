class Game
  attr_reader :turn,
              :count_turns

  def initialize(turn)
    @turn = turn
    @count_turns = 0
  end

  def start
    start_message
    error_or_start
  end

  def start_message
    puts " "
    puts "😈  Welcome to War! 😈 (or Peace) This game will be played with 52 cards."
    puts "The players today are Megan and Aurora."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    puts " "
    print "> "
    @player_input = input.upcase
  end

  def error_message
    puts " "
    puts  "❌  Oops! Input not valid. Try again! ❌"
  end

  def input
    gets.chomp
  end

  def error_or_start
    if @player_input == 'GO'
      start_game
    else
      until @player_input == 'GO'
        error_message
        start_message
      end
    end
  end

  def results
    if @turn.type == :basic
      @count_turns += 1
      puts "Turn #{@count_turns}: #{@turn.winner.name} has won 2 cards!"
    elsif @turn.type == :war
      @count_turns += 1
      puts "Turn #{@count_turns}: WAR - #{@turn.winner.name} has won 6 cards!"
    elsif @turn.type == :mutually_assured_destruction
      @count_turns += 1
      puts "Turn #{@count_turns}: *mutually assured destruction* 6 cards removed from play"
    else puts "TIME'S UP! ---- DRAW ----"
    end
  end

  def start_game
    until @turn.player1.has_lost? || @turn.player2.has_lost? || @count_turns == 1000000
      winner = @turn.winner
      results
      @turn.pile_cards
      @turn.award_spoils(winner)
      @turn.clear_spoils
    end
    puts "#{winner.name} has won the game!"
  end
end
