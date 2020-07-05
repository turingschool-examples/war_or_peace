

class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end




  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(0) && player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
    end
  end



  def card_draw(x)
    if  player1.deck.rank_of_card_at(x) > player2.deck.rank_of_card_at(x)
      player1
    else
      player2
    end
  end


    def winner
      if type == :war
        card_draw(2)

      elsif type == :mutually_assured_destruction
        "No Winner"
      else type == :basic
        card_draw(0)
      end


    end

    def pile_of_cards(type)

      if type == :war
        3.times {spoils_of_war << player1.deck.remove_card}
        3.times {spoils_of_war << player2.deck.remove_card}

      elsif type == :basic
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player2.deck.remove_card
      end
    end

    def award_spoils(winner)
      winner.deck.cards.concat 
    end

end
