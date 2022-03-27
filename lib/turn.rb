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
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
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
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.cards.shift
      end
      3.times do
        player2.deck.cards.shift
      end
      spoils_of_war
    elsif type == :war
      3.times do
        spoils_of_war << player1.deck.cards.shift
      end
      3.times do
        spoils_of_war << player2.deck.cards.shift
      end
      spoils_of_war
    end

  end

  def award_spoils(winner)
    if winner == player1
      spoils_of_war.each do|spoils|
        player1.deck.cards << spoils #.join can be used?
      end
    else
      spoils_of_war.each do|spoils|
        player2.deck.cards << spoils
      end
    end
  end
end
