require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :cards_won, :remove_card, :winner

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      type = :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      type = :mutually_assured_destruction
    else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      type = :war
    end
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @winner = @player1
      elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        @winner = @player2
      end
    elsif type == :mutually_assured_destruction
      puts 'No winner'
      @winner = @player1 && @player2
    else type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @winner = @player1
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        @winner = @player2
      end
    end
  end

  def pile_cards
    if type == :basic
        @spoils_of_war << @player1.deck.cards.shift
        @spoils_of_war << @player2.deck.cards.shift
    elsif type == :mutually_assured_destruction
        3.times do
          @player1.deck.cards.shift
          @player2.deck.cards.shift
        end
    elsif type == :war
        3.times do
          @spoils_of_war << @player1.deck.cards.shift
          @spoils_of_war << @player2.deck.cards.shift
        end
    end
  end

  def award_spoils(winner)
    winner
    winner.deck.cards.concat(@spoils_of_war.slice!(0..-1))
  end
end
