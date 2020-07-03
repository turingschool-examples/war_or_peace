require './lib/deck'
require './lib/card'
require './lib/player'

class Turn
attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1_param, player2_param)
    @player1 = player1_param
    @player2 = player2_param
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) ==  player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) ==  player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) ==  player2.deck.rank_of_card_at(0)
      :war
    else :basic
    end
  end

  def winner
    if type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else player2
      end
    elsif type == :mutually_assured_destruction
      "No Winner"
    else
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      player1
    else player2
    end
  end
end



end
