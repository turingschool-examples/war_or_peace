require 'deck.rb'
require 'card.rb'
require 'player.rb'
require 'pry'

class Turn
 attr_reader :player_1, :player_2, :spoils_of_war

 def initialize(player_1 , player_2)
    @player_1 = player_1
    @player_2 = player_2
    @spoils_of_war_arr = []
 end

  def spoils_of_war
    @spoils_of_war_arr
  end

  def type
    if player_1.deck.rank_of_card_at(0) != player_2.deck.rank_of_card_at(0)
    :basic
    elsif player_1.deck.rank_of_card_at(0) == player_2.deck.rank_of_card_at(0) && player_1.deck.rank_of_card_at(2) != player_2.deck.rank_of_card_at(2)
      :war
    elsif player_1.deck.rank_of_card_at(0) == player_2.deck.rank_of_card_at(0) && player_1.deck.rank_of_card_at(2) == player_2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic && player_1.deck.rank_of_card_at(0) > player_2.deck.rank_of_card_at(0)
      player_1
    elsif type == :basic && player_2.deck.rank_of_card_at(0) > player_1.deck.rank_of_card_at(0)
    player_2
    elsif type == :war && player_1.deck.rank_of_card_at(2) > player_2.deck.rank_of_card_at(2)
      player_1
    elsif type == :war && player_2.deck.rank_of_card_at(2) > player_1.deck.rank_of_card_at(2)
      player_2
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war_arr << player_1.deck.cards.last
      @spoils_of_war_arr << player_2.deck.cards.last
      player_1.deck.cards.pop
      player_2.deck.cards.pop

    elsif type == :war
      @spoils_of_war_arr << player_1.deck.cards.last(3)
      @spoils_of_war_arr << player_2.deck.cards.last(3)
      @spoils_of_war_arr = @spoils_of_war_arr.flatten
      player_1.deck.cards.pop(3)
      player_2.deck.cards.pop(3)
    elsif type == :mutually_assured_destruction
      player_1.deck.cards.pop(3)
      player_2.deck.cards.pop(3)
    end
  end

  def award_spoils(winner)
    if winner == player_1
     @spoils_of_war_arr.select do |spoil|
        player_1.deck.cards << spoil
      end

    elsif winner == player_2
    @spoils_of_war_arr.select do |spoil|
    player_2.deck.cards << spoil
    end
    end
      @spoils_of_war_arr = []
  end
end
