require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

class Game
  attr_reader :turn
  def initialize(turn)
    @turn = turn
  end

  def start
    turn_count = 0

    until turn.player1.has_lost? == true || turn.player2.has_lost? == true || turn_count == 1000000 do
      turn_count += 1
      turn.spoils_of_war.clear

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
    end
  end

end

binding.pry
