class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  # def spoils_of_war
  #   @spoils_of_war
  # end

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    else
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        return player2
      else
      end

    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        return player2
      else
      end

    else type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def pile_cards
    #@spoils_of_war = []
    if type == :basic
      @spoils_of_war.push(player1.deck.remove_card).push(player2.deck.remove_card)
    elsif type == :war
      @spoils_of_war.push(player1.deck.remove_card).push(player2.deck.remove_card)
      @spoils_of_war.push(player1.deck.remove_card).push(player2.deck.remove_card)
      @spoils_of_war.push(player1.deck.remove_card).push(player2.deck.remove_card)
    else type == :mutually_assured_destruction
      # 3.times{player1.deck.remove_card}
      # 3.times{player2.deck.remove_card}

    end
  end

end
