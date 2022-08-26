require "./lib/card.rb"
require "./lib/deck.rb"
require "./lib/player.rb"

class Turn 
  attr_reader :player1,
              :player2,
              :spoils_of_war 

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type 
    if player1.deck.cards.length >= 2 && player2.deck.cards.length >= 2
      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
        :war 
      else 
        :basic 
      end 
    else 
      if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
        :war 
      else 
        :basic 
      end 
    end
  end

  def winner 
    if self.type == :mutually_assured_destruction
      "No Winner"
    elsif self.type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else 
        player2
      end
    else
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2 
      end
    end
  end

  def pile_cards 
    if self.type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif self.type == :war 
      3.times {@spoils_of_war << @player1.deck.cards.shift}
      3.times {@spoils_of_war << @player2.deck.cards.shift}
    else 
      3.times {@player1.deck.cards.delete_at(0)}
      3.times {@player2.deck.cards.delete_at(0)}
    end
  end

  def award_spoils(winner)
    winner.deck.cards.concat(@spoils_of_war)
  end
end 
