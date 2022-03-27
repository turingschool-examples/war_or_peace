require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type, :winner
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type
    @winner
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @type = :basic
    else
      if @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        @type = :mutually_assured_destruction
      else
        @type = :war
      end
    end
  end

  def winner
    if @type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @winner = @player1
      else
        @winner = @player2
      end
    elsif @type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @winner = @player1
      else
        @winner = @player2
      end
    else #@type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def pile_cards
    if @type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif @type == :war
      3.times {@spoils_of_war << @player1.deck.remove_card}
      3.times {@spoils_of_war << @player2.deck.remove_card}
    else
      3.times {@spoils_of_war << @player1.deck.remove_card}
      3.times {@spoils_of_war << @player2.deck.remove_card}
      @spoils_of_war = []
    end
  end

  def award_spoils(winner)
    if @type == :mutually_assured_destruction
      @spoils_of_war = []
    else
      winner.deck.cards << @spoils_of_war
      winner.deck.cards.flatten!
    end
  end
end
