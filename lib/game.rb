require_relative 'turn'
require 'pry'
class Game 
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are Megan and Aurora."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    input = gets.chomp.upcase
    if input == 'GO'
      turn_count = 0 #this will create a counter variable
      while turn_count < 1_000_000 #game loop,
        turn = Turn.new(@player1, @player2)
        turn_count += 1 #increment it by 1 each turn
        turn.pile_cards
        puts "Turn #{turn_count}: #{turn.winner.name}: #{turn.spoils_of_war.count}"
        turn.award_spoils(turn.winner)
        if @player1.deck.cards.empty? #how we know if player 1 has lost 
          puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
          break
        elsif @player2.deck.cards.empty? #how we know if player 2 has lost 
          puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
          break
        end

        if turn_count == 1_000_000  #create tie once it reaches 1,000,000
          puts "---- DRAW ----"
          break
        end 
      end
    end 
  end
end