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
    else (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      @type = :mutually_assured_destruction
    end
  end

  def winner
    if @type == :basic
      if (player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0))
        @winner = player1
      elsif (player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0))
        @winner = player2
      end
    elsif @type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @winner = player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        @winner = player2
      end
    else
      @winner = 'No winner'
    end

    def pile_cards
      if @type = :basic
        player1.deck(0) << spoils_of_war
        player2.deck(0) << spoils_of_war
      elsif @type = :war
        player1.deck(0,1,2) << spoils_of_war
        player2.deck(0,1,2) << spoils_of_war
      else
        player1.deck(0,1,2) << 
        player2.deck(0,1,2) <<


    end
  end

end
