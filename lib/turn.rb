class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      :war
    else
      :mutually_assured_destruction
    end
  end

  def winner
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @player1
      else @player2
      end
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      if player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        @player2
      else @player1
      end
    else
      return "No winner"
    end
  end

  def pile_cards
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
    elsif player1.deck.cards[0] == player2.deck.cards[0] && player1.deck.cards[2] != player2.deck.cards[2]
      @spoils_of_war << player1.deck.cards[0..2]
      @spoils_of_war << player2.deck.cards[0..2]
    else
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
  end
end
