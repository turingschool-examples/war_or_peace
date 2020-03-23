class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = turn_type
  end

def turn_type
  if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
    :basic
  elsif player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
    :war
  else
    :mutually_assured_destruction
  end
end

end
