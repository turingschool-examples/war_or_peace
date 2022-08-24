require 'deck.rb'
require 'card.rb'
require 'player.rb'

class Turn
 attr_reader :player_1, :player_2, :spoils_of_war, :pile_cards_arr

 def initialize(player_1 , player_2)
    @player_1 = player_1
    @player_2 = player_2
    @spoils_of_war_arr = []
    @pile_cards_arr = []
  end

  def spoils_of_war
    @spoils_of_war_arr
  end

  def type
    if player_1.deck[0].rank != player_2.deck[0].rank
    :basic
    elsif player_1.deck[0].rank == player_2.deck[0].rank
      :war
    elsif player_1.deck[0].rank == player_2.deck[0].rank && player_1.deck[2].rank == player_2.deck[2].rank
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic && player_1.deck[0].rank > player_2.deck[0].rank
      player_1
    elsif type == :basic && player_2.deck[0].rank > player_1.deck[0].rank
    player_2
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war_arr << player_1.deck[0]
      @spoils_of_war_arr << player_2.deck[0]
      player_1.deck.shift
      player_2.deck.shift
    end
  end



end
