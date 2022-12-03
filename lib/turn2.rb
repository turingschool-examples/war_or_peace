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
      if @player1.deck.cards.length >=3 && @player2.deck.cards.length >=3
        if @player1.rank_of_card_at(2)!= @player2.rank_of_card_at(2)
          return :war
        elsif @player1.rank_of_card_at(2) == @player2.rank_of_card_at(2)
          return :mutually_assured_destruction
        end
      else return :tiebreaker
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
    @spoils_of_war = []
    # binding.pry
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
    player1.deck.cards = player1.deck.cards.shuffle
    player2.deck.cards = player2.deck.cards.shuffle
    if winner == player1
      # binding.pry
      @spoils_of_war.each do |card|
      @player1.deck.cards << card
      end
    elsif winner == player2  
      @spoils_of_war.each do |card|
        @player2.deck.cards << card
        end
    end
  end

end