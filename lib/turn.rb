require './lib/deck.rb'
require './lib/card.rb'

class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.rank_of_cards_at(0) != player2.rank_of_cards_at(0)
      :basic
    elsif player1.rank_of_cards_at(0) == player2.rank_of_cards_at(0)
      :war
    elsif
      {
      player1.rank_of_cards_at(0) == player2.rank_of_cards_at(0) &&
      player1.rank_of_cards_at(2) == player2.rank_of_cards_at(2)
      }
      :mutually_assured_destruction
    else
      "404: Correct coding not found"
    end
  end

  def winner(type_of_turn)
    if type_of_turn == :basic
      if player1.rank_of_cards_at(0) > player2.rank_of_cards_at(0)
        "player1"
      else
        "player2"
      end

    elsif type_of_turn == :war
      if player1.rank_of_cards_at(2) > player2.rank_of_cards_at(2)
        "player1"
      else
        "player2"
      end

    elsif type_of_turn == :mutually_assured_destruction
      "No Winner"

    else
      "404: Correct coding not found"
    end
  end

  def pile_cards(type_of_turn)
    if type_of_turn == :basic
      spoils_of_war.push(player1[0] + player2[0])
      player1.remove_card
      player2.remove_card
    elsif type_of_turn == :war
      spoils_of_war.push(player1[0,1,2] + player2[0,1,2])
      3.times do
        player1.remove_card
        player2.remove_card
      end
    elsif type_of_turn == :mutually_assured_destruction
      3.times do
        player1.remove_card
        player2.remove_card
      end
    else
      "404: Correct coding not found"
    end
  end

  def award_spoils
    if winner(:basic) == "player1"
      player1.add_card([spoils_of_war])
    elsif winner(:basic) == "player2"
      player2.add_card([spoils_of_war])
    elsif winner(:war) == "player1"
      player1.add_card([spoils_of_war])
    elsif winner(:war) == "player2"
      player2.add_card([spoils_of_war])
    elsif winner(:mutually_assured_destruction) == "No Winner"
    else
      "404: Correct coding not found"
    end
  end
