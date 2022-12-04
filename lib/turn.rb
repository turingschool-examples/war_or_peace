require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'

class Turn
attr_reader :player1, 
            :player2, 
            :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.rank_of_card_at(0) != @player2.rank_of_card_at(0)
      :basic
    else 
      if @player1.deck.cards.length >=3 && @player2.deck.cards.length >=3
        if @player1.rank_of_card_at(2)!= @player2.rank_of_card_at(2)
          :war
        elsif @player1.rank_of_card_at(2) == @player2.rank_of_card_at(2)
          :mutually_assured_destruction
        end
      else #this describes the scenario where the first cards tie, but there are not enough
           #cards for a :war or :mutually_assured_destruction
        :tiebreaker
      end 
    end
  end

  def winner
    if @player1.rank_of_card_at(0) > @player2.rank_of_card_at(0)
      @player1
    elsif @player2.rank_of_card_at(0) > @player1.rank_of_card_at(0)
      @player2
    else
      if @player1.rank_of_card_at(2) > @player2.rank_of_card_at(2)
        @player1
      elsif @player2.rank_of_card_at(2) > @player1.rank_of_card_at(2)
        @player2
      else
       "No Winner"
      end
    end
  end
  
  def pile_cards
    @spoils_of_war = []
    if type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif type == :war
      3.times do
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
      end
    elsif type == :mutually_assured_destruction
      3.times do
        da_trash = []
        da_trash << @player1.deck.cards.shift
        da_trash << @player2.deck.cards.shift
      end
    end
  end

  def award_spoils(winner)
    @spoils_of_war = @spoils_of_war.shuffle
    if winner == player1
      @spoils_of_war.each {|card| @player1.deck.cards << card}
    elsif winner == player2  
      @spoils_of_war.each {|card| @player2.deck.cards << card}
    end
  end

end