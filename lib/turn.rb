class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  #if deck1[0] != deck2[0] turn = basic
  #if deck1[0] == deck2[0] turn = war
  #if deck1[0] == deck2[0] &&
  #if deck1[2] == deck2[2] turn =mad

  def type
    :basic
      if deck1[0] != deck2[0]
        return :basic
      end
    :war
      if deck1[0] == deck2[0]
        return :war
      end
    :mutually_assured_destruction
      if deck1[0] == deck2[0] &&
          deck1[2] == deck2[2]
        return :mutually_assured_destruction
      end 
  end

  #def winner
  #end

  #def pile_cards
  #spoils_of_war << cards
  #end

end
