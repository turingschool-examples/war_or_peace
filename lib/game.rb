require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'
require './lib/game'

class Game
  attr_reader :player1,
              :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
  end

  def start_welcome
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
  end

  def turn_count
    @turn_count += 1
  end

  def start
    loop = loop do
      turn = Turn.new(player1, player2)
      turn.pile_cards

      if
        turn.type == :basic
        p "Turn #{turn_count}: #{turn.winner.name} won 2 cards"
        turn.award_spoils(turn.winner)
      elsif
        turn.type == :war
        p "Turn #{turn_count}: WAR - #{turn.winner.name} won 6 cards"
        turn.award_spoils(turn.winner)
      else
        turn.type == :mutually_assured
        p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
      end

      if
        (player1.deck.cards.length == 0 || player2.deck.cards.length == 0)
        break
      end
    end
  end
end
