require 'rspec'
require 'pry'


class Turn
attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type

  if @player1.deck.cards.count < 3 || @player2.deck.cards.count < 3
    :draw
  else
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      :basic
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank && @player1.deck.cards[2].rank == @player2.deck.cards[2].rank
      :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      :war
    end
  end

  end

  def winner
    # binding.pry
    type
    if type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        @player1
      else
        @player2
      end
    elsif type == :mutually_assured_destruction
      "No Winner"
    elsif type == :war
        if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
          @player1
        else
          @player2
        end
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      @player1.deck.cards.delete_at(0)
      @player1.deck.cards.delete_at(1)
      @player1.deck.cards.delete_at(2)
      @player2.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(1)
      @player2.deck.cards.delete_at(2)
    elsif type == :basic
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
    end
  end

  def award_spoils(winner)
    if winner == @player1
      @spoils_of_war.each do |card|
        @player1.deck.cards << card
      end
      @spoils_of_war.clear
    elsif winner == @player2
      @spoils_of_war.each do |card|
        @player2.deck.cards << card
      end
      @spoils_of_war.clear
    end

  end

end
