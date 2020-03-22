require './lib/card'
require './lib/deck'
require './lib/player'


class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
  @player1 = player1
  @player2 = player2
  @spoils_of_war = []
  end

  def type
    turn_result = nil
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) || @spoils_of_war.count == 2
      turn_result = :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        turn_result = :mutually_assured_destruction
    else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) || @spoils_of_war.count == 6
      turn_result = :war

    end
      turn_result
  end

  def pile_cards
    if type == :mutually_assured_destruction
      @player1.deck.cards.shift(3)
      @player2.deck.cards.shift(3)
    elsif type == :war
     spoils_of_war << @player1.deck.cards[0..2]
     spoils_of_war << @player2.deck.cards[0..2]
     spoils_of_war.flatten!
    else type == :basic
     spoils_of_war << @player1.deck.cards[0]
     spoils_of_war << @player2.deck.cards[0]
     spoils_of_war.flatten!
     @player1.deck.remove_card
     @player2.deck.remove_card
    end
end


  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end
    else
      "No Winner"
    end
  end

  def award_spoils(winner)    
    if type == :basic || :war
      winner_cards = winner.deck.cards << spoils_of_war
      winner_cards.flatten!
      spoils_of_war.clear
    else
      "No Winner"
    end
  end

end
