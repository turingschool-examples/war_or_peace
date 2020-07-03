require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :turn_number
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    turn_number = 0
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif
      player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
      "No Winner"
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        player2
      end
    elsif type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        player2
      end
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      player1.deck.remove_card
      player1.deck.remove_card
      player1.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
    elsif type == :war
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
      spoils_of_war << player2.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    elsif type == :basic
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    winner.deck.cards.concat(spoils_of_war)
  end
# If issues come up it may be this... ^
# Do we need winner variable declared?
  # def start
  #     # turn_number += 1
  #     turn.type
  #     winner = turn.winner
  #     turn.pile_cards
  #     p "#{@winner} won #{turn.pile_cards.count} cards"
  #     turn.award_spoils(winner)
  #
  #
  # end
end
