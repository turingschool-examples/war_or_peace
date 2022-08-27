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
    player_1_first_card = player_1.deck.rank_of_card_at(0)
    player_2_first_card = player_2.deck.rank_of_card_at(0)
    if player_1.deck.cards.length >= 3 && player_2.deck.cards.length >= 3
      player_1_third_card = player_1.deck.rank_of_card_at(2)
      player_2_third_card = player_2.deck.rank_of_card_at(2)
    end

    if player_1_first_card != player_2_first_card
      :basic
    elsif player_1_first_card == player_2_first_card && player_1_third_card != player_2_third_card
      :war
    elsif player_1_first_card == player_2_first_card && player_1_third_card == player_2_third_card
      :mutually_assured_destruction
    elsif player_1_first_card == player_2_first_card && player_1.deck.length < 3
      :player_1_does_not_have_enough_cards_to_go_to_war
    elsif player_1_first_card == player_2_first_card && player_2.deck.length < 3
      :player_2_does_not_have_enough_cards_to_go_to_war
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
    elsif type == :player_1_does_not_have_enough_cards_to_go_to_war
      player_2
    elsif type == :player_2_does_not_have_enough_cards_to_go_to_war
      player_1
    else
      nil
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war_arr << player_1.deck.cards.first
      @spoils_of_war_arr << player_2.deck.cards.first
      player_1.deck.cards.shift
      player_2.deck.cards.shift
    elsif type == :war
      @spoils_of_war_arr << player_1.deck.cards.first(3)
      @spoils_of_war_arr << player_2.deck.cards.first(3)
      @spoils_of_war_arr = @spoils_of_war_arr.flatten
      player_1.deck.cards.shift(3)
      player_2.deck.cards.shift(3)
    elsif type == :mutually_assured_destruction
      player_1.deck.cards.shift(3)
      player_2.deck.cards.shift(3)
    elsif type == :player_1_does_not_have_enough_cards_to_go_to_war
      "Game over"
    elsif type == :player_2_does_not_have_enough_cards_to_go_to_war
      "Game over"
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

