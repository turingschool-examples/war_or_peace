class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = [ ] #write tests for these
  end

  def type
  end

  def winner
  end

  def pile_cards
  end

  def award_spolis
  end

end
