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
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
    end
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      "No Winner"
    end
  end

  def pile_cards
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      @spoils_of_war << player1.deck.cards.shift(3)
      @spoils_of_war << player2.deck.cards.shift(3)
      @spoils_of_war.flatten!
    else
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    awarded = winner.deck.cards << @spoils_of_war
    awarded.flatten!
  end
end
