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
    type
    if type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        return @player1
      else
        return @player2
      end
      #MAd begins
    elsif type == :mutually_assured_destruction
      "No Winner"
    elsif type == :war
        if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
          return @player1
        else
          return @player2
        end
    end
  end

  def pile_cards()
    if type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @player1.deck.cards.delete_at(0)
      @spoils_of_war << @player2.deck.cards[0]
      @player2.deck.cards.delete_at(0)
    elsif type == :war
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player1.deck.cards[1]
      @spoils_of_war << @player1.deck.cards[2]
      @player1.deck.cards.delete_at(0)
      @player1.deck.cards.delete_at(1)
      @player1.deck.cards.delete_at(2)
      @spoils_of_war << @player2.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[1]
      @spoils_of_war << @player2.deck.cards[2]
      @player2.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(1)
      @player2.deck.cards.delete_at(2)
    elsif type == :mutually_assured_destruction
      @player1.deck.cards.delete_at(0)
      @player1.deck.cards.delete_at(1)
      @player1.deck.cards.delete_at(2)
      @player2.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(1)
      @player2.deck.cards.delete_at(2)
    end
  end

  def award_spoils(winner)
    if winner == @player1
      @spoils_of_war.each do |card|
        @player1.deck.cards << card
      end
    elsif winner == @player2
      @spoils_of_war.each do |card|
        @player2.deck.cards << card
      end
    end

  end


end
