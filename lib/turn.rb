class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @spoils_of_war = []
  end

  def type
    :basic if @player1.deck.first_card != @player2.deck.first_card
    
  end

end
