require 'rspec'
require 'pry'


class Turn
attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
  # potential pseudocode solution for the three symbols
  # If criteria for basic then assign something to basic
  #    return something = :basic
  # If criteria for war then assign something to war
  #   return something = :war
  # If criteria for war then assign something to MAD
  #   return something = :mutually_assured_destruction
  def type()
    #when the rank of the card at index 0 (first card) for player1 does NOT equal the rank of the card at index 0 for player2, the type of the Turn class is :basic
    # it should return :basic when using pry to interact
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
        :basic
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      :mutually_assured_destruction
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

end
