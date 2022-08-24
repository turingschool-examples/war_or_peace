require "./card.rb"
require "./deck.rb"
require "./player.rb"

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
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war 
    else 
      :basic 
    end 
  end

  def winner 
    if self.type == :mutually_assured_destruction
      "No Winner"
    elsif self.type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else 
        player2
      end
    else
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2 
      end
    end
  end
end 