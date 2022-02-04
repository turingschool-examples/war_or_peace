

# require_relative 'card'
# require_relative 'deck'

require_relative 'card'
require_relative 'deck'
require_relative 'player'

require 'pry'
#commented .cards in line 26 27

class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end
# binding.pry

#a method built to find card rank of a player
  def find_rank_of_card(player, index)
    # binding.pry
     player.deck.deck[index].rank
  end
# binding.pry
# binding.pry
  def type
    # binding.pry
     # @player1_c = @player1.deck.cards
     # @player2_c = @player2.deck.cards
     if find_rank_of_card(@player1, 0) != find_rank_of_card(@player2, 0)
       return @type = :basic
     else
        if find_rank_of_card(@player1, 2) == find_rank_of_card(@player2, 2)
          return @type = :mutually_assured_destruction
        else
          return @type = :war
        end
      end
     # if @player1_c[0].rank != @player2_c[0].rank
     #   :basic
     # else
     #   if @player1_c[2].rank != @player2_c[2].rank

    #
    # end
  end



  def winner
    type
    if @type == :basic
      if  find_rank_of_card(@player1, 0) > find_rank_of_card(@player2, 0)
        return @player1
      else
        return @player2
      end
    elsif @type == :war
      if find_rank_of_card(@player1, 2) > find_rank_of_card(@player2, 2)
        return @player1
      else
        return @player2
      end
    elsif @type == :mutually_assured_destruction
      return "No Winner"
    end
  end


  def pile_cards
    if @type == :basic
      #binding.pry
      spoils_of_war << @player1.deck.remove_card #had extra .cards here
      spoils_of_war << @player2.deck.remove_card
    elsif @type == :war

      3.times do
        spoils_of_war << @player1.deck.remove_card
        spoils_of_war << @player2.deck.remove_card
      end
      # binding.pry

    elsif @type ==:mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end

  end

  def award_spoils(winner)
    if @type == :war
      spoils_of_war.each do |spoiled_card|
      # binding.pry
        winner.deck.deck   << spoiled_card
        spoils_of_war.shift
      end
    elsif @type == :basic
      spoils_of_war.each do |spoiled_card|
      # binding.pry
        winner.deck.deck   << spoiled_card
        spoils_of_war.shift
      end

    end

  end
end
