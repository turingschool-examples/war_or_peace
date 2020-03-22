require './lib/card'
require './lib/deck'
require './lib/player'


class Turn
  attr_reader :player1, :player2, :spoils_of_war, :is_mutual

  def initialize(player1, player2)
  @player1 = player1
  @player2 = player2
  @spoils_of_war = []
  @is_mutual = []
  end

  def type
    turn_result = nil
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2) && @spoils_of_war == [] || @is_mutual == true
      turn_result = :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) || @spoils_of_war.count == 2
      turn_result = :basic
    else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) || @spoils_of_war.count == 6
      turn_result = :war
    end
      turn_result
  end

  def pile_cards
    mutual_test = []
    if type == :mutually_assured_destruction
      mutual_test << @player1.deck.cards.shift(3)
      mutual_test << @player2.deck.cards.shift(3)
      mutual_test.flatten!
      if mutual_test.empty?
        @is_mutual = false
      else
        @is_mutual = true
      end
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
    end
  end

end
