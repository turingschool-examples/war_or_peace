require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'

class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :war
    end
  end

  def winner
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)

      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        'No Winner'

    else

      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end
    end

  end

  def pile_cards #basic then mad then war
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)

      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)

      @player1.deck.remove_card
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card

    elsif @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)

      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card

    end


  end

end
