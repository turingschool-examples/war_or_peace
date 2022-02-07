require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

class Game
  attr_reader :player1, :player2
  attr_accessor :turns
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turns = []
  end

  def start
    turn_count = 0

    until player1.has_lost? || player2.has_lost? || turn_count == 1000000 do
      turn_count += 1
      turn = Turn.new(player1, player2)

      if turn.type == :basic
        p "Turn#{turn_count}: #{turn.winner.name} won 2 cards"
        turn.pile_cards
        turn.award_spoils(turn.winner)
      elsif turn.type == :war
        p "Turn#{turn_count}: WAR - #{turn.winner.name} won 6 cards."
        turn.pile_cards
        turn.award_spoils(turn.winner)
      elsif turn.type == :mutually_assured_desctruction
        p "Turn#{turn_count}: *mutually assured destruction*: 6 cards removed from play."
        turn.pile_cards
      end
      @turns << turn
    end

    if turn.player1.deck.cards.count == 0
      p "WINNER: #{turn.player2.name}"
      p "#{turn.player1.name}: #{turn.player1.deck.cards.count} cards"
      p "#{turn.player2.name}: #{turn.player2.deck.cards.count} cards"
      p "GAME OVER"
    elsif turn.player2.deck.cards.count == 0
      p "WINNER: #{turn.player1.name}"
      p "#{turn.player1.name}: #{turn.player1.deck.cards.count} cards"
      p "#{turn.player2.name}: #{turn.player2.deck.cards.count} cards"
      p "GAME OVER"
    elsif turn_count == 1000000
      p "~~~~~~~DRAW~~~~~~~"
    end
  end

end

# binding.pry
