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
      p1_war = []
      p2_war = []
      3.times do
        p1_war << @player1.deck.cards.shift
        p2_war << @player2.deck.cards.shift
        if p1_war.last.rank > p2_war.last.rank
          return :war
        else
          return :mutually_assured_destruction
        end
      end
    end
  end


  def rank_of_card_at(number)
    deck.cards[number].rank
  end

  def winner
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
       return "No winner"
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

  def award_spoils
    if winner == player1
      @player1.deck.cards << @spoils_of_war
    elsif winner == player2  
      @player2.deck.cards << @spoils_of_war
    else
      nil    
    end
  end

end