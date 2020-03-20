require './lib/card'
require './lib/deck'
require './lib/player'


class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
  @player1 = player1
  @player2 = player2
  @spoils_of_war = []
  end

  def type
    turn_result = nil
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      turn_result = :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      turn_result = :war
    else
      turn_result = :basic
    end
      turn_result
  end


end
