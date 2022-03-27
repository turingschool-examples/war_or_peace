require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
class Game
  attr_reader :playe
  def initialize (player_a, player_b)
    @turn_count = turn_count
    @player_a = player_a
    @player_b = player_b

  def start
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    until player_a.has_lost? || player_b.has_lost? || turn_count == 1000001
      if type == :basic
        p "Basic - #{player.name} won 2 cards"

    elsif type == :war
        p "War - #{player.name} won 6 cards"

    elsif type == :mutually_assured_destruction
      p "Mutually assured destruction - 6 cards removed"

    @turn_count += 1
    end
      if turn.player_b.has_lost?
        p "#{turn.player_a.name} has won!"

    elsif turn.player_a.has_lost?
        p "#{turn.player_b.name} has won!"

    elsif @turn_count == 1000001
      p "DRAW"
      end
    end
  end
end
end
