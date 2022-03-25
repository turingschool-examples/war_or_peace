class Turn
  require 'rspec'
  require './lib/card'
  require './lib/deck'
  require './lib/player'
  require 'pry'
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if(@player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0))
      return :basic

    elsif((@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) &&
       (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)))
       return :mutually_assured_destruction

     else
       return :war
     end
  end

  def winner(type)
    if(type == :basic)
      if(@player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0))
        return @player1
      else
        return @player2
      end
    elsif(type == :war)
      if(@player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2))
        return @player1
      else
        return @player2
      end
    else
      return "No Winner"
    end
  end

  def pile_cards(type)
    if(type == :basic)
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif(type == :war)
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    else
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end
  end

  def award_spoils(winning_player)

    @spoils_of_war.each do |card|
      winning_player.deck.add_card(card)
    end
    @spoils_of_war.clear()
  end


end
