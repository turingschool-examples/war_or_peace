class Turn
  require 'rspec'
  require './lib/card'
  require './lib/deck'
  require './lib/player'
  require 'pry'
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if(@player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0))
      return :basic
    elsif(@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
       && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
       return :mutually_assured_destruction
     else
       return :war
  end



end
