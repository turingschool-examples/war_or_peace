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
    if player1.deck.cards.count == 2 || player2.deck.cards.count == 2
      return "draw"
      return
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
       return :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        return player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        return player2
      end
    elsif type == :mutually_assured_destruction
      return 'No winner'
    end
  end

  def pile_cards
    if type == :basic
      spoils_of_war << player1.deck.cards.shift
      spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      3.times do
      spoils_of_war << player1.deck.cards.shift
      spoils_of_war << player2.deck.cards.shift
      end
    elsif type == :mutually_assured_destruction
      3.times do
      player1.deck.cards.shift
      player2.deck.cards.shift
      end
    end
  end

  def award_spoils(winner)
    # require "pry";binding.pry
    if winner == player1
      spoils_of_war.each do |spoiler|
        player1.deck.cards << spoiler
      end
      # require "pry";binding.pry
    else
      spoils_of_war.each do |spoiler|
        player2.deck.cards << spoiler
      end
    end
  end
end
