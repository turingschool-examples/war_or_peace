class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    :basic
    #code
    :war
    #code
    :mutually_assured_destuction
    #code
  end

  def winner
  end

  def pile_cards
  end
end
