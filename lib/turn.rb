require './lib/card'
require './lib/deck'
require './lib/player'
require './pry'

class Turn

  attr_reader :player1, :player2, :spoils_of_war

  #Initialize takes in two player objects
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  #Determine the type of play based on the first cards from each player's deck
  #if the first cards are the same rank check the third card in each deck
  def type
    p1_rank = @player1.deck.rank_of_card_at(0)
    p2_rank = @player2.deck.rank_of_card_at(0)
    #binding.pry
    type = :basic
    if (p1_rank == p2_rank)
      type = :war
      p1_rank_2 = @player1.deck.rank_of_card_at(2)
      p2_rank_2 = @player2.deck.rank_of_card_at(2)
      if (p1_rank_2 == p2_rank_2)
        type = :mutually_assured_destruction
      end
    end
    return type
  end

end
