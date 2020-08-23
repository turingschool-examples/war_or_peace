require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require "pry"

class Game

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p "Welcome, to the game"
    p "Type GO to start"
    user_input = gets.chomp
    if user_input == "GO"
      count = 1
      until @player1.deck.cards.empty? ||
            @player2.deck.cards.empty? do
        turn = Turn.new(player1, player2)
        #1. Megan (p1) wins turn 1 (basic turn)
        #2. Aurora (p2) wins 6 cards (War)
        #3. *mutually assured destruction* 6 cards removed from play (cards are deleted)
        #cards = 46
        #4. Aurora won 2 cards
        #5. p *~*~*~* Aurora has won the game! *~*~*~*
        if turn.type == :basic
          puts "Turn #{count}: #{turn.winner} won #{turn.spoils_of_war.count} cards"
        end
        turn.type
        turn.winner
        turn.pile_cards
        turn.spoils_of_war
        turn.awards_spoils(turn.winner) #asking it to give the return value of the method turn.type
        count += 1
      end
    else
      p 'Please enter GO'
    end
  end
end
