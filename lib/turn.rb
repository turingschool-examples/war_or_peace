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

  def type
    # @basic = basic   unsure why i added these...
    # @war = war
    # @mutually_assured_destruction = mutually_assured_destruction
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        player2
      end

    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        player2
      end

    elsif type == :mutually_assured_destruction
      'No winner'
    end
  end

  def pile_cards
    if type == :basic
      spoils_of_war.push(player1.deck.cards.shift)
      spoils_of_war.push(player2.deck.cards.shift)
    elsif type == :war
      3.times do
        spoils_of_war.push(player1.deck.cards)
      end
      3.times do
        spoils_of_war.push(player2.deck.cards
      end
    elsif type == :mutually_assured_destruction
      spoils_of_war
    end
  end
  #
  # def award_spoils(winner)
  #   if winner == player1
  #     player1.deck.cards << spoils_of_war #.join can be used?
  #   else winner == player2
  #     player2.deck.cards << spoils_of_war
  #   end
  # end
end
