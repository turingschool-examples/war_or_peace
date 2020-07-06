require './lib/deck'
require './lib/turn'
require './lib/player'
require 'pry'

class Game
  attr_reader :cards, :player1, :player2
  def initialize(cards)
    @cards = cards
    deck1 = Deck.new(@cards[0..@cards.length / 2 - 1])
    deck2 = Deck.new(@cards[@cards.length / 2..@cards.length])
    @player1 = Player.new('Ryan', deck1)
    @player2 = Player.new('Tim', deck2)
  end

  def start
    puts welcome_message
    if (gets.chomp.downcase == "go")
      play_game
    end
  end

  def play_game
    turn_count = 1
    winner_name = ""
    loop do
      turn = Turn.new(@player1, @player2)
      winner = turn.winner
      type = turn.type

      if turn.player1.has_lost? || turn.player2.has_lost?
        winner_name = turn.winner.name
        break
      end

      turn.pile_cards

      turn_message(turn_count, type, winner)

      turn.award_spoils(turn.winner)
      turn_count += 1
    end
    p "*~*~*~* #{winner_name} has won the game! *~*~*~*"
  end

  def welcome_message
    "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are #{@player1.name} and #{@player2.name}.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
  end

  def turn_message(turn_count, type, winner)
    if (type == :war)
      p "Turn #{turn_count}: WAR - #{winner.name} won 6 cards"
    elsif (type == :mutually_assured_destruction)
      p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from game"
    else
      p "Turn #{turn_count}: #{winner.name} won 2 cards"
    end
  end
end
