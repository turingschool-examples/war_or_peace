require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_accessor :player1, :player2, :spoils_of_war

  $turn_number = 0
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    $turn_number += 1
  end

  def type

    if (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2))
      :war
      # require "pry"; binding.pry
    elsif (player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0))
      :basic
    end
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1.name
      else
        @player2.name
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1.name
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        @player2.name
      elsif type == :mutually_assured_destruction
      "No Winner"
    end
    end
  end

  def pile_cards
    if type == :basic
      (@spoils_of_war.push(@player1.deck.cards[0], @player2.deck.cards[0])).flatten!
    elsif type == :war
      (@spoils_of_war.push(@player1.deck.cards[0], @player1.deck.cards[1], @player1.deck.cards[2], @player2.deck.cards[0], @player2.deck.cards[1], @player2.deck.cards[2])).flatten!
    end
  end

  def award_spoils(winner)
    if winner == "Megan"
      if type == :basic
        @player1.deck.cards.shift
        @player2.deck.cards.shift
        (@player1.deck.cards << @spoils_of_war).flatten!.shuffle
      elsif type == :war
        3.times {@player1.deck.cards.shift}
        3.times{@player2.deck.cards.shift}
        (@player1.deck.cards << @spoils_of_war).flatten!.shuffle
      end
    elsif winner == 'Aurora'
      if type == :basic
        @player1.deck.cards.shift
        @player2.deck.cards.shift
        (@player2.deck.cards << @spoils_of_war).flatten!.shuffle
      elsif type == :war
        3.times {@player1.deck.cards.shift}
        3.times{@player2.deck.cards.shift}
        (@player2.deck.cards << @spoils_of_war).flatten!.shuffle
      end
    elsif type == :mutually_assured_destruction
      3.times {@player1.deck.cards.shift}
      3.times {@player2.deck.cards.shift}
    end
  end
end
