require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'

class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :war

    else
      return :mutually_assured_destruction
    end


  end



end
