require 'rspec'
require 'pry'


class Turn
attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type()
    #when the rank of the card at index 0 (first card) for player1 does NOT equal the rank of the card at index 0 for player2, the type of the Turn class is :basic
    # :basic type
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
        :basic
    # MAD type
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      :mutually_assured_destruction
    # :war type
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      :war
    end

  end

  def winner()
    # :basic turn winner
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        return @player1
      else
        return @player2
      end
    # MAD turn winner
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      "No Winner"
    # :war turn winner
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        return @player1
      else
        return @player2
      end
    end
  end

  def pile_cards()
# for a :basic turn, each player will send one card (the top card) to the spoils pile
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      @spoils_of_war << @player1.deck.cards[0]
      @player1.deck.cards.delete_at(0)
      @spoils_of_war << @player2.deck.cards[0]
      @player2.deck.cards.delete_at(0)
    end
  end

end
