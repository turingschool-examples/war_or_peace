require 'pry'
require './lib/deck.rb'
require './lib/card.rb'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :winner
  def initialize(player1, player2)
    #do stuff[
    @spoils_of_war = []
    @player1 = player1
    @player2 = player2
    @type = type()
    @winner = winning_player()
  end

  def type()
    #binding.pry
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @type = :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      @type = :mutually_assured_destruction
    else
      @type = :war
    end
  end

  def winning_player()
    if type() == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @winner = @player1
      else
        @winner = @player2
      end
      #This happened in testing, more than once. Someone ran out of cards on War and broke the game.
      #Executive decision - if someone runs out of cards and cannot complete a war or mad scenario, they lose.
      #checking these conditions before running war or mad should stop that from happening again. I think?
      #If not all these comments will make it easy to find where I broke it more.
    elsif @player1.deck.rank_of_card_at(2) == nil && @player2.deck.rank_of_card_at(2) != nil
      @winner = @player2
    elsif @player2.deck.rank_of_card_at(2) == nil && @player1.deck.rank_of_card_at(2) != nil
      @winner = @player1
      #now stop breaking, code!
    elsif type() == :war
      if@player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @winner = @player1
      else
        @winner = @player2
      end
    else
      @winner = "No Winner"
    end
  end

  def pile_cards ()
    winner
    if(type()==:basic)
      card_in_transit = @player1.deck.remove_card
      @spoils_of_war << card_in_transit
      card_in_transit = @player2.deck.remove_card
      @spoils_of_war << card_in_transit
    elsif(type()==:war)
      3.times do
        card_in_transit = @player1.deck.remove_card
        @spoils_of_war << card_in_transit
      end
      3.times do
        card_in_transit = @player2.deck.remove_card
        @spoils_of_war << card_in_transit
      end
    else
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
        end
      end
    end

  def award_spoils()
    if (@type == :basic || @type == :war)
      @winner.deck.add_card(@spoils_of_war)
    end
    # binding.pry
  end
end
