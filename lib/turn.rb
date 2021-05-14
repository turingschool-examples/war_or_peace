require './lib/player'
require './lib/deck'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @player1_c1 = @player1.deck.rank_of_card_at(0)
    @player2_c1 = @player2.deck.rank_of_card_at(0)
    @p1ayer1_c2 = @player1.deck.rank_of_card_at(2)
    @player2_c2 = @player2.deck.rank_of_card_at(2)
  end

  def type
    if @player1_c1 != @player2_c1
      :basic
    elsif @player1_c1 == @player2_c1 && @p1ayer1_c2 != @player2_c2
      :war
    elsif @player1_c1 == @player2_c1 && @p1ayer1_c2 == @player2_c2
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      result = @player1_c1 > @player2_c1
    elsif type == :war
      result = @p1ayer1_c2 > @player2_c2
    else type == :mutually_assured_destruction
      result = nil
    end

    if result == true
      @player1
    elsif result == false
      @player2
    else
      'No Winner'
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @player1.deck.remove_card
      @spoils_of_war << @player2.deck.cards[0]
      @player2.deck.remove_card

    elsif type == :war
      3.times do
      @spoils_of_war << @player1.deck.cards[0]
      @player1.deck.remove_card
      @spoils_of_war << @player2.deck.cards[0]
      @player2.deck.remove_card
      end

    elsif type == :mutually_assured_destruction
      3.times do
      @player1.deck.remove_card
      @player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    if winner == @player1
      @spoils_of_war.each do |spoil|
        @player1.deck.add_card(spoil)
      end
    elsif winner == @player2
      @spoils_of_war.each do |spoil|
        @player2.deck.add_card(spoil)
      end
    end
    @spoils_of_war = []
  end
end
