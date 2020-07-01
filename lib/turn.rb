require './lib/player'
require 'pry'

class Turn

  attr_reader :player_1, :player_2, :spoils_of_war

  def initialize (player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @spoils_of_war = []
  end

  def type (p1_card1_rank,
            p1_card2_rank,
            p2_card1_rank,
            p2_card2_rank)

    if p1_card1_rank != p2_card1_rank
      return :basic
    else
      if p1_card2_rank == p2_card2_rank
        return :mutually_assured_destruction
      else
        return :war
      end
    end
  end

  def winner

  end

  def pile_cards

  end

  def award_spoils

  end

end
