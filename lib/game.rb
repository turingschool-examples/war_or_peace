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
          if turn.type == :basic
            puts "Turn #{count}: #{turn.winner} won #{turn.spoils_of_war.count} cards"
            turn.type
            turn.winner
            turn.pile_cards
            turn.spoils_of_war
            turn.awards_spoils(turn.winner)
          elsif turn.type == :war
            [@player1, @player2].each do |player|
              3.times{@spoils_of_war << player.deck.remove_card}
            end
            turn.type
            turn.winner
            turn.pile_cards
            turn.spoils_of_war
            turn.awards_spoils(turn.winner)
            puts "Turn #{count}: #{turn.winner} won #{turn.spoils_of_war.count} cards"
          elsif turn.type == :mutually_assured_destruction
            puts "Turn #{count}: #{turn.winner} won #{turn.spoils_of_war.count} cards"
            turn.type
            turn.winner
            turn.pile_cards
            turn.spoils_of_war
            turn.awards_spoils(turn.winner)
          end

          count += 1
      end
    else
      p 'Please enter GO'
    end
  end
end
