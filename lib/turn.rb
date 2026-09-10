require 'pry'
require '../lib/card'
require '../lib/deck'
require '../lib/player'

class Turn
  attr_reader :player1, :player2, :war_spoils

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @war_spoils = []
  end

  def type 
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end


  def winner

    if type == :basic
      basic_ranks_array = [player1.deck.rank_of_card_at(0), player2.deck.rank_of_card_at(0)]
      winning_index = basic_ranks_array.find_index(basic_ranks_array.max)
      if winning_index == 0
        @player1
      elsif winning_index == 1
        @player2
      end

    elsif type == :war
      war_ranks_array = [player1.deck.rank_of_card_at(2), player2.deck.rank_of_card_at(2)]
      winning_index = war_ranks_array.find_index(war_ranks_array.max)
      if winning_index == 0
        @player1
      elsif winning_index == 1
        @player2
      end

    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end
  
  def pile_cards
  if type == :basic
    war_spoils << player1.deck.remove_card
    war_spoils << player2.deck.remove_card

  elsif type == :war
    3.times do
      war_spoils << player1.deck.remove_card
      war_spoils << player2.deck.remove_card
    end

  elsif type == :mutually_assured_destruction
    3.times do
      player1.deck.remove_card
      player2.deck.remove_card
    end
  end
end

  def award_spoils(winner)
    war_spoils.each do |card|
      winner.deck.add_card(card)
    end
  end
end



