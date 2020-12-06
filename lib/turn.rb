require './lib/card'
require './lib/player'
require './lib/deck'
require 'pry'

class Turn
  attr_reader :player1,
              :player2,
              :player3,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.cards[0].rank != player2.deck.cards[0].rank
      :basic
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank != player2.deck.cards[2].rank
      :war
    elsif
      player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      :mutually_assured_destruction
    end
  end

  def winner
   if type == :basic
     return player1 if player1.deck.cards[0].rank > player2.deck.cards[0].rank
     return player2 if player1.deck.cards[0].rank < player2.deck.cards[0].rank
   elsif type == :war
     return player1 if player1.deck.cards[2].rank > player2.deck.cards[2].rank
     return player2 if player1.deck.cards[2].rank < player2.deck.cards[2].rank
   elsif type == :mutually_assured_destruction
     #binding.pry
     "No Winner"
   end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card(1)
      @spoils_of_war << player2.deck.remove_card(1)
      @spoils_of_war.flatten!
    elsif type == :war
      @spoils_of_war << player1.deck.remove_card(3)
      @spoils_of_war << player2.deck.remove_card(3)
      @spoils_of_war.flatten!
    elsif type == :mutually_assured_destruction
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils
    unless type == :mutually_assured_destruction
      winner.deck.add_card(@spoils_of_war)
      winner.deck.cards.flatten!
    end
  end
end
