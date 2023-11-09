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
    require 'pry' ; binding.pry
    if player1.deck.rank_of_card_at(0) != player2.rank_of_card_at(0)
      puts :basic
    elsif player1.deck.rank_of_card_at(0) == player2.rank_of_card_at(0)
      puts :war 
    else
    # else player1.rank_of_card_at(0) == player2.rank_of_card_at(0) && player1.rank_of_card_at(0) == player2.rank_of_card_at(2)
      puts :mutually_assured_destruction
    end
  end
end