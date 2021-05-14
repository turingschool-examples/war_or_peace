require './lib/player'
require './lib/deck'

class Turn
  attr_reader :player_1, :player_2, :spoils_of_war

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @spoils_of_war = []
  end

  def type
    p1_c1 = @player_1.deck.rank_of_card_at(0)
    p2_c1 = @player_2.deck.rank_of_card_at(0)
    p1_c2 = @player_1.deck.rank_of_card_at(2)
    p2_c2 = @player_2.deck.rank_of_card_at(2)
    if p1_c1 != p2_c1
      :basic
    elsif p1_c1 == p2_c1 && p1_c2 != p2_c2
      :war
    elsif p1_c1 == p2_c1 && p1_c2 == p2_c2
      :mutually_assured_destruction
    end
  end
end
