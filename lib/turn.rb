require 'pry'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      :war
    else
      :basic
    end
  end

  def winner
    # type == without `self` works here because ruby allows for an implicit self. Without it, it wasn't clear to me what object `type` was running on. Adding `self` doesn't change how this is run, but it makes it more explicit.
    if self.type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        @player1
      else
        @player2
      end
    elsif self.type == :war
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        @player1
      else
        @player2
      end
    else self.type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    #spoils of war is the pile in the middle in a turn
    if self.type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
    elsif self.type == :war
      @spoils_of_war.concat(@player1.deck.cards[0..2])
      @spoils_of_war.concat(@player2.deck.cards.concat[0..2])
    else self.type == :mutually_assured_destruction
      @player1.deck.cards.delete(0..2)
      @player2.deck.cards.delete(0..2)
    end
  end

  def award_spoils
    # only add cards from the spoils pile if they are not already in the winner's deck of cards
    spoil_cards_not_in_winner_deck = []

    if self.type == :basic || self.type == :war
      spoil_cards_not_in_winner_deck = @spoils_of_war.select do |card|
        !winner.deck.cards.include?(card)
      end
      winner.deck.cards.concat(spoil_cards_not_in_winner_deck)
    else self.type == :mutually_assured_destruction
      nil
    end
  end
end
