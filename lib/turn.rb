require './card'
require './deck'
require './player'

class Turn
  attr_reader :player1, :player2, :basic, :war, :mutually_assured_destruction, :winner, :pile_cards, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  # def spoils_of_war
  #   @spoils_of_war = []
  # end

  def type
    @basic = basic
    @war = war
    @mutually_assured_destruction = mutually_assured_destruction
    if player1.deck.rank_of_card_at(0)!= player2.deck.rank_of_card_at(0)
      return :basic

    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    else player1.deck.rank_of_card_at(0) && player2.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(0) && player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    end
  end



  def winner
    # require 'pry'; binding.pry
    if type == :basic && player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      return @player1
    elsif type == :basic && player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      return @player2
    elsif type == :war && player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      return @player1
    elsif  type == :war && player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
      return @player2
    else type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    else type == :mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    winner.deck.cards.concat(@spoils_of_war)
    @spoils_of_war.clear
  end

  # @spoils_of_war.each do |winnings|
  #   winner.deck.add_card(winnings)


end
