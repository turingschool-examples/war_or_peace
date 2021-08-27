require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :turn_type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_type = turn_type
  end

  def type
    if player1.deck.cards[0].rank != player2.deck.cards[0].rank
      turn_type = :basic
    elsif player1.deck[0].rank == player2.deck[0].rank
      turn_type = :war
    elsif player1.deck[0].rank == player2.deck[0].rank && player1.deck[2].rank == player2.deck[2].rank
      turn_type = :mutually_assured_destruction
    end
    turn_type
  end

  def winner
    if type == :basic
      player1.deck.cards[0].rank > player2.deck.cards[0].rank
      print player1
    else
      print player2
    end

    if type == :war
      #maybe try player1.rank_of_card_at
      player1.deck.cards[2].rank > player2.deck.cards[2].rank
      print player1
    else
      print player2
    end

    if type == :mutually_assured_destruction
      print "No Winner"
    end
  end
end
