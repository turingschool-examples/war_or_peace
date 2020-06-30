

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_rank = player1_rank
    @player2_rank = player2_rank
  end

  def type
    if @player1_rank != @player2_rank
      :basic
    elsif @player1_rank == @player2_rank
      :war
    elsif @player1_rank == @player2_rank && @player1_rank == @player2_rank
      :mutually_assured_destruction
    end
  end

  def winner


  end

end
