class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) &&(player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war

    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    if type == :basic
      # return whichever player has a higher rank_of_card_at(0)
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type == :war
      # winner will be whichever player has a higher rank_of_card_at(2)
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    elsif type == :mutually_assured_destruction
      # return No Winner
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      # each player will send one card (the top card) to the spoils pile
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card

    elsif type == :war
      # each player will send three cards (the top three cards) to the spoils pile
      3.times do
        @spoils_of_war << player1.deck.remove_card
      end

      3.times do
        @spoils_of_war << player2.deck.remove_card
      end

    elsif type == :mutually_assured_destruction
      # each player will remove three cards from play (the top three cards in their deck). These cards are not sent to the spoils pile, they are simply removed from each players’ deck.
      3.times {player1.deck.remove_card}

      3.times {player2.deck.remove_card}
    end
  end

  def award_spoils(winner)
  # will add each of the cards in the @spoils_of_war array to the winner of the turn.

    @spoils_of_war.each do |card|
      winner.deck.add_card(card)
    end
  end
end
