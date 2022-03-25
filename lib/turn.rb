require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_type = nil
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      @turn_type = :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      @turn_type = :war
    else
      @turn_type = :basic
    end
  end

  def winner
    # binding.pry
    if @turn_type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif @turn_type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    else
      "No Winner"
    end
  end

  def pile_cards
    # binding.pry
    if @turn_type == :basic
      @spoils_of_war << player1.deck.cards.shift << player2.deck.cards.shift
    elsif @turn_type == :war
      @spoils_of_war << player1.deck.cards.shift(3) << player2.deck.cards.shift(3)
      @spoils_of_war.flatten!
    else
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)
    if winner = "No Winner"
      "Mutually Assured Destruction"
    else
    winner.deck.cards << @spoils_of_war
    end
  end

end
