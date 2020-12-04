require 'pry'

class Turn

  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def rank_test(index)
    @player1.deck.rank_of_card_at(index) == @player2.deck.rank_of_card_at(index)
  end

  def type
    if rank_test(0) && rank_test(2)
      :mutually_assured_destruction
    elsif rank_test(0)
      :war
    else
      :basic
    end
  end
end
