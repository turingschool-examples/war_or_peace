require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
  
  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.\n"
    puts "The players today are #{player1.name} and #{player2.name}.\n"
    puts "Type 'GO' to start the game!"
    user_response = gets.chomp
    while user_response != "GO"
      puts "Sorry, that was not a valid response.\n"
      puts "Type 'GO' to start the game!"
      user_response = gets.chomp
    end
    play
  end
  
  def play
    turn_count = 0
    until player1.has_lost? || player2.has_lost? do
      turn_count += 1
      turn = Turn.new(player1, player2)
      turn.winner
      
      if turn.type == :sudden_death
        puts "Turn #{turn_count}: Sudden Death - #{turn.loser.name} didn't have enough cards for a WAR..."
      elsif turn.type == :basic
        puts "Turn #{turn_count}: #{turn.winner.name} won 2 cards!\n"
      elsif turn.type == :war
        puts "Turn #{turn_count}: WAR - #{turn.winner.name} won 6 cards\n"
      elsif turn.type == :mutually_assured_destruction
        puts "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play\n"
      end
      
      turn.pile_cards
      turn.award_spoils(@turn_winner)
      
      if player1.has_lost? || player2.has_lost?
        puts "*~*~*~* #{player1.deck.cards[0].nil? ? player2.name : player1.name} has won the game! *~*~*~*"
        break
      end
      if turn_count == 1000000
        puts "---- DRAW ----"
        break
      end
    end
  end
end