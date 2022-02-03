require './lib/card'
require './lib/deck'
require './lib/player'

class Turn

  attr_accessor :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_type
  end

  def type
    if player1.deck.cards[0].rank > player2.deck.cards[0].rank
      @turn_type = :basic
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank != player2.deck.cards[2].rank
      @turn_type = :war
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      @turn_type = :mutually_assured_destruction
    end
  end
end
