require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_type = nil
    @winner = nil
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @turn_type = :basic
      # binding.pry
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      @turn_type = :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      @turn_type = :war
    end
  end

  def winner
    # binding.pry
    if @turn_type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @winner = player1
    elsif @turn_type == :war && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @winner = player1
    elsif @turn_type == :mutually_assured_destruction
      @winner = "No Winner"
    else
      @winner = player2
    end
  end

  def pile_cards
    if @turn_type == :basic
      # binding.pry
      @spoils_of_war << @player1.deck.remove_card
    #pulling in method from /deck
      @spoils_of_war << @player2.deck.remove_card
    elsif @turn_type == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
        # binding.pry
      end
      # binding.pry
      return @spoils_of_war
    else @turn_type == :mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
    # return @spoils_of_war
      end
    end
  end

  def award_spoils
    @spoils_of_war.length.times do
      @winner.deck.cards << @spoils_of_war.shift
    end
  end
end
