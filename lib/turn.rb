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
  # require "pry"; binding.pry
    if type == :basic
      # each player will send one card (the top card) to the spoils pile
      player1.deck.cards.shift(1) << @spoils_of_war
      player2.deck.cards.shift(1) << @spoils_of_war

    elsif type == :war
      # each player will send three cards (the top three cards) to the spoils pile
       player1.deck.cards.shift(3) << @spoils_of_war
       player2.deck.cards.shift(3) << @spoils_of_war

    elsif type == :mutually_assured_destruction
      # each player will remove three cards from play (the top three cards in their deck). These cards are not sent to the spoils pile, they are simply removed from each players’ deck.
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)

    end
  end

end
