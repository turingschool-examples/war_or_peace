require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start()
    puts "Welcome to War! (or Peace) This game will be played with #{@turn.player1.deck.cards.length + @turn.player2.deck.cards.length} cards."
    puts "The players today are #{@turn.player1.name} and #{@turn.player2.name}."
    puts "Type 'GO' to start the game!"
    puts "--------------------------------------------------------------------------------"

    input = gets.chomp.downcase
    if input == 'go'
      play_game()
    end
  end

  def play_game()
    turn_counter = 1
    until @turn.player1.has_lost? || @turn.player2.has_lost? || turn_counter > 1000000
      type = @turn.type()
      winner = @turn.winner
      if type == :basic
        puts "Turn #{turn_counter}: #{winner.name} won 2 cards"
        @turn.pile_cards()
        @turn.reward_spoils(winner)
      elsif type == :war
        puts "Turn #{turn_counter}: WAR - #{winner.name} won 6 cards"
        @turn.pile_cards()
        @turn.reward_spoils(winner)
      else
        puts "Turn #{turn_counter}: *mutually assured destruction* 6 cards removed from play"
        @turn.pile_cards()
      end
      turn_counter += 1
    end

    if @turn.player1.has_lost?
      puts "Winner: #{@turn.player2.name}"
    elsif @turn.player2.has_lost?
      puts "Winner: #{@turn.player1.name}"
    else
      puts "Draw #{@turn.player1.deck.cards.length} : #{@turn.player2.deck.cards.length}"
    end
  end
end
