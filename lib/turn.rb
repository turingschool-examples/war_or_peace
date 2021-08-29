class Turn
  attr_reader   :player1,
                :player2,
                :spoils_of_war

  def initialize(player1, player2)
    @player1        = player1
    @player2        = player2
    @spoils_of_war  = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return player1
      else
        return player2
      end
    end

    if type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return player1
      else
        return player2
      end
    end

    if type == :mutually_assured_destruction
      return "No winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war.push(player1.deck.remove_card)
      @spoils_of_war.push(player2.deck.remove_card)
    end
    if type == :war
      @spoils_of_war << player1.deck1[0..2]
      @spoils_of_war << player2.deck2[0..2]
    end
    if type == :mutually_assured_destruction

    end
  end

  def award_spoils

  end 

end
