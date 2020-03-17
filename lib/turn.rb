require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic
    elsif @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      return :war
    else
      return :mutually_assured_destruction
    end
  end

  def winner
    if self.type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end
    elsif self.type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    else
      return "No Winner"
    end
  end

  def pile_cards
    c = 0
    if self.type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif self.type == :war
      while c <= 2
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
        c += 1
      end
    else
      while c <= 2
        @player1.deck.remove_card
        @player2.deck.remove_card
        c += 1
      end
    end
  end

  def award_spoils
    if spoils_of_war != []
      spoils_of_war.each do |spoil|
        self.winner.deck.add_card(spoil)
      end
    end
  end
end
