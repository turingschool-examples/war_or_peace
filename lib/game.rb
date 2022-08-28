# require 'rspec'
# require 'pry'
# require './lib/card'
# require './lib/deck'
# require './lib/player'
# require './lib/turn'

class Game
attr_reader :player1, 
            :player2
            :start

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_number = 0
  end 

  def start
    welcome = "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are #{@player1.name} and #{@player2.name}.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
    p welcome
    user_start
  end 

  def user_start
    type_go = gets.chomp 
      if type_go.upcase == "GO"
        turn = Turn.new(@player1, @player2)
        until @turn_number >= 1000000 || (@player1.deck.cards.length == 0 || @player2.deck.cards.length == 0)
          if turn.type == :basic 
            @turn_number += 1
            turn_winner = turn.winner
            turn.pile_cards
            turn.award_spoils(turn_winner)
            p "Turn #{@turn_number}: #{turn.winner.name} won 2 cards" 
          elsif turn.type == :war
            @turn_number += 1
            turn_winner = turn.winner
            turn.pile_cards
            turn.award_spoils(turn_winner)
            p "Turn #{@turn_number}: WAR - #{turn.winner.name} won 6 cards"
          elsif turn.type == :mutually_assured_destruction
            @turn_number += 1
            turn_winner = turn.winner
            turn.pile_cards
            p "Turn #{@turn_number}: *mutually assured destruction* 6 cards removed from play"
          end 
          end_game
        end
      else 
        p "Please try again" 
      end 
  end 

  def end_game 
    if @turn_number == 1000000
      p "----DRAW----"
    elsif @player1.deck.cards.length == 0 
      p "*~*~*~*#{@player1.name} has won the game!"
    elsif @player2.deck.cards.length == 0 
      p "*~*~*~*#{@player2.name} has won the game!"
    end 
  end 
end 