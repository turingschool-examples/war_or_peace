require '../lib/card'
require '../lib/deck'
require '../lib/player'
require '../lib/turn'
require '../lib/start'

class Start
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    counter = 1
    while counter <= 1000000

      winner = turn.winner

      if turn.type == :basic
        p "Turn #{counter}: #{winner.name} won 2 cards"
      elsif turn.type == :war
        p "Turn #{counter}: WAR - #{winner.name} won 6 cards"
      else
        p "Turn #{counter}: *mutually_assued_destruction* 6 cards removed from play"
      end

      turn.pile_cards

      turn.award_spoils(winner)

      check_lost([turn.player1, turn.player2])

      check_draw(counter)

      counter += 1
    end
  end

  def check_draw(counter)
    if counter == 1000000
      p "---- DRAW ----"
      exit!
    end
  end

  def check_lost(players)
    players.each do |player|
      if player.has_lost? == true
        player.lost = true
      end

      if players[0].lost == true
        display_win(players[1])
      elsif players[1].lost == true
        display_win(players[0])
      end
    end
  end

  def display_win(player)
    p "*~*~*~* #{player.name} has won the game! *~*~*~*"
    exit!
  end
end
