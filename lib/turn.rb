require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end
# binding.pry
  #

  # player2_0 = @player2.deck.cards[0].rank
  # player1_2 = @player1.deck.cards[2].rank
  # player2_2 = @player2.deck.cards[2].rank
# binding.pry
  def type
     @player1_c = @player1.deck.cards
     @player2_c = @player2.deck.cards

     if @player1_c[0].rank != @player2_c[0].rank
       :basic
     else
       if @player1_c[2].rank != @player2_c[2].rank
         :war
       else
         :mutually_assured_destruction
       end
     end
    #
    # if find_rank_of_card(@player1, 0) != find_rank_of_card(@player2, 0)
    #   return :basic
    # elsif find_rank_of_card(@player1, 0) == find_rank_of_card(@player2, 0) && find_rank_of_card(@player1, 2) == find_rank_of_card(@player2, 2)
    #   return :mutually_assured_destruction
    # elsif find_rank_of_card(@player1, 0) == find_rank_of_card(@player2, 0)
    #   return :war
    # end
  end

#a method built to find card rank of a player
  # def find_rank_of_card(player, index)
  #    player.deck.cards[index].rank
  # end

  def winner
    type
    if type == :basic
      if  @player1_c[0].rank > @player2_c[0].rank
        return @player1
      else
        return @player2
      end
    elsif type == :war
      if @player1_c[2].rank > @player2_c[2].rank
        return @player1
      else
        return @player2
      end
    elsif type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      #binding.pry
      spoils_of_war << @player1.deck.remove_card
      spoils_of_war << @player2.deck.remove_card
    elsif type == :war

      3.times do
        spoils_of_war << @player1.deck.remove_card
        spoils_of_war << @player2.deck.remove_card
      end
      # binding.pry

    elsif type ==:mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end

  end

  def award_spoils(winner)
    spoils_of_war.each do |spoiled_card|
      # binding.pry
      winner.deck.cards << spoiled_card
    end
  end

  def start
    
  end

end
