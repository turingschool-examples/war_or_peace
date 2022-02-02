#'./lib/turn.rb'
require './lib/card'
require './lib/deck'
require './lib/player'


class Turn

  attr_reader :player1, :player2
  def initialize (player1, player2)

    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end

  def type
    if @player1.rank_of_card_at(0) != @player2.rank_of_card_at(0)
      return :basic

    elsif (@player1.rank_of_card_at(0) == @player2.rank_of_card_at(0)) &&
        (@player1.rank_of_card_at(2) == @player2.rank_of_card_at(2))
      return :mutually_assured_destruction

    elsif @player1.rank_of_card_at(0) == @player2.rank_of_card_at(0)
      return :war
    end
  end

  def spoils_of_war
  end

  def winner
  end

  def pile_cards
  end

  def award_spoils
  end

end
