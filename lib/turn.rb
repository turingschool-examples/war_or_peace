require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'
require './lib/player.rb'
require 'pry'

class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0))
      @type = :basic
    elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0))
      @type = :war
    elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      @type = :mutually_assured_destruction
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
      spoils_of_war << player1.deck.cards.shift
      spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      spoils_of_war << player1.deck.cards.shift(0, 1, 2)
      spoils_of_war << player2.deck.cards.shift(0, 1, 2)
    elsif type == :mutually_assured_destruction
      player1.deck.cards.shift(0, 1, 2)
      player2.deck.cards.shift(0, 1, 2)
    end
  end

  def award_spoils(winner)
    require "pry";binding.pry
    if winner == player1
      spoils_of_war.each do |spoiler|
        player1.deck.cards << spoiler
      end
      require "pry";binding.pry
    else
      player2.deck.cards << spoils_of_war
    end
  end
end
