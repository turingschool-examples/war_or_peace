require 'pry'

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
    if player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      :mutually_assured_destruction
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank != player2.deck.cards[2].rank
      :war
    else
      :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
     "No Winner"
   elsif type == :war
     return player1 if player1.deck.cards[2].rank > player2.deck.cards[2].rank
     return player2 if player1.deck.cards[2].rank < player2.deck.cards[2].rank
   else
     return player1 if player1.deck.cards[0].rank > player2.deck.cards[0].rank
     return player2 if player1.deck.cards[0].rank < player2.deck.cards[0].rank
   end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    elsif type == :war
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    else
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    end
  end

  def award_spoils
    self.winner.deck.cards << @spoils_of_war
    winner.deck.cards.flatten!
  end
end
