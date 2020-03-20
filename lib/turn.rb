# turn class
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'


class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war =[]

  end



  def type
    if @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      type = :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      type = :war
    else @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      type = :basic
    end
   end



end
