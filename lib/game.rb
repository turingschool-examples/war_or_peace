require './lib/turn'

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @players = [@player1, @player2]
  end

  def start
    display_greeting
    get_user_input

    if @signal == "GO"
      counter = 0
      turn = Turn.new(@player1, @player2)
      until @player1.has_lost? || @player2.has_lost?
        break if max_turns?(counter)
        break if insufficient_cards?() # Ends game when a player doesn't have enough cards to play
        turn_winner = turn.winner
        current_turn_type = turn.type
        turn.pile_cards
        determine_spoils(turn, turn_winner)
        turn_message(counter, turn_winner, current_turn_type)
        counter += 1
      end
      exit if counter == 999_999
      game_winner = determine_winner()
      announce_winner(game_winner)
    end
  end

  def display_greeting
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are #{@player1.name} and #{@player2.name}.\nType 'GO' to start the game!\n------------------------------------------------------------------"
  end

  def get_user_input
    @signal = gets.chomp.upcase
    unless @signal == "GO"
      puts "Type 'GO' to start the game!\n------------------------------------------------------------------"
      get_user_input
    end
    @signal
  end

  def max_turns?(counter)
    if counter == 999_999
      puts "---- DRAW ----"
      true
    end
  end

  def insufficient_cards?
    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.cards.length < 3 || @player2.deck.cards.length < 3)
      loser = @players.min { |player1, player2| player1.deck.cards.length <=> player2.deck.cards.length }
      loser.deck.cards = []
    end
  end

  def turn_message(counter, turn_winner, current_turn_type)
    if current_turn_type == :basic
      puts "Turn #{counter + 1}: #{turn_winner.name} won 2 cards - for a total of #{turn_winner.deck.cards.length}"
    elsif current_turn_type == :war
      puts "Turn #{counter + 1}: WAR - #{turn_winner.name} won 6 cards - for a total of #{turn_winner.deck.cards.length}"
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
    puts "*~*~*~* ♠️ ♥️ ♣️ ♦️  #{winner.name} has won the game! ♠️ ♥️ ♣️ ♦️ *~*~*~*"
  end
end
