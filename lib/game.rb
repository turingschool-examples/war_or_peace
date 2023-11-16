require "./lib/turn"

class Game
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @counter = 0
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are #{player1.name} and #{player2.name}."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    start_game_on_user_input
  end

  def start_game_on_user_input
    command = nil
    while command != 'GO'
      "Type 'GO' to start the game!"
      command = gets.chomp
    end
    play_game
  end

  def play_game
    until @player1.has_lost? || @player2.has_lost?
      turn = Turn.new(@player1, @player2)
      winner = turn.winner
      if turn.type == :basic
        turn.pile_cards
        turn.award_spoils(winner)
        @counter + 1
        puts "#{winner.name} won 2 cards"
      elsif turn.type == :war
        turn.pile_cards
        turn.award_spoils(winner)
        @counter + 1
        puts "WAR - #{winner.name} won 6 cards"
      else
        turn.mutually_assured_destruction_play
        @counter + 1
        puts "*mutually assured destruction* 6 cards removed from play"
      end
      break if @player1.has_lost? || @player2.has_lost? || @counter == 400
    end
  end
end

# while/until loop - p1.deck.cards.count == 0 || p2.deck.cards.count == 0
# take a turn
# if turn is type basic -
  # add cards to spoils
  # award spoils to winner

# do what turn says to do, establish a winner
# start again

# pile_cards returned nil value when the cards were empty, this could be better