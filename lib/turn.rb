class Turn
  attr_reader :player1, :player2, :war_winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    # when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same
    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) &&
      ((@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)))
      return :mutually_assured_destruction
    # when both players’ rank_of_card_at(0) are the same.
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :war
    # when the rank_of_card_at(0) from the players’ decks are not the same rank
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic
    end
  end

  def winner
    # if turn type is :basic, return player with a higher rank_of_card_at(0)
    if self.type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @war_winner = @player1
      else
        @war_winner = @player2
      end
    # if turn type is :war, the winner is player with a higher rank_of_card_at(2)
    elsif self.type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @war_winner = @player1
      else
        @war_winner = @player2
      end
    # if turn type is :mutually_assured_destruction, return No Winner
    else # if self.type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def pile_cards
    # for :basic turn, each player will send 1 card (the top card) to spoils pile
    if self.type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift

    # for :war turn, each player will send 3 cards (the top 3 cards) to spoils pile
    elsif self.type == :war
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player1.deck.cards.shift

      @spoils_of_war << @player2.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    # for a :mutually_assured_destruction turn, each player will remove 3 cards
    # from play (the top 3 cards in their deck). These cards are not sent to the
    # spoils pile, they are simply removed from each players’ deck.
    else # self.type == :mutually_assured_destruction
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player1.deck.remove_card

      @player2.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
    end
  end

  # this method will add each of the cards in the @spoils_of_war array
  # to the winner of the turn
  def award_spoils
  end
end
