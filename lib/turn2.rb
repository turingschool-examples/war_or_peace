require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require 'pry'

class Turn
attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end


  def type
    if @player1.rank_of_card_at(0) != @player2.rank_of_card_at(0)
      return :basic
    else 
        if @player1.rank_of_card_at(2)!= @player2.rank_of_card_at(2)
          return :war
        else
          return :mutually_assured_destruction
        end
    end
  end
    
  


  

  def winner
    # binding.pry
    if @player1.rank_of_card_at(0) > @player2.rank_of_card_at(0)
      return @player1
    elsif @player2.rank_of_card_at(0) > @player1.rank_of_card_at(0)
      return @player2
    else
      if @player1.rank_of_card_at(2) > @player2.rank_of_card_at(2)
        return @player1
      elsif @player2.rank_of_card_at(2) > @player1.rank_of_card_at(2)
        return @player2
      else
       return "No Winner"
      end
    end
  end
  
  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif type == :war
      3.times do
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
      end
    else
      3.times do
        da_trash = []
        da_trash << @player1.deck.cards.shift
        da_trash << @player2.deck.cards.shift
      end
    end
  end

  def award_spoils(winner = @winner)
    if winner == player1
      @player1.deck.cards << @spoils_of_war
    elsif winner == player2  
      @player2.deck.cards << @spoils_of_war
    else
      nil    
    end
  end

end